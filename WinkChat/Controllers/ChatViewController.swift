//
//  ChatViewController.swift
//  Wink Chat
//
//  Created by Taneem on 12/06/2025.

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    //var messages: [Message] = [Message(sender: "1@2.com", body: "Hey Sexy Baby!"),Message(sender: "a@b.com", body: "OH My God Pu Pu Hi!"), Message(sender: "1@2.com", body: "You are such a fine shyt!!")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarAppearance()
        messageTextfield.delegate = self
        tableView.dataSource = self
        navigationItem.hidesBackButton = true

        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        loadMessages()
    }
    
    private func setupNavigationBarAppearance() {
        let navBar = navigationController?.navigationBar
        
        // Create custom appearances
        let standardAppearance = UINavigationBarAppearance()
        let scrollEdgeAppearance = UINavigationBarAppearance()

        // Configure title text attributes
        let titleTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: Constants.BrandColors.magenta) ?? .systemPink,
            .font: UIFont.systemFont(ofSize: 20, weight: .black)]
        
        // Customize STANDARD appearance (default state)
        standardAppearance.backgroundColor = UIColor(named: Constants.BrandColors.yellow)
        standardAppearance.shadowColor = UIColor(named: Constants.BrandColors.yellow)
        standardAppearance.titleTextAttributes = titleTextAttributes // Set title attributes

        // Customize SCROLL EDGE appearance (when scrolling)
        scrollEdgeAppearance.backgroundColor = UIColor(named: Constants.BrandColors.yellow)
        scrollEdgeAppearance.shadowColor = UIColor(named: Constants.BrandColors.yellow)
        scrollEdgeAppearance.titleTextAttributes = titleTextAttributes // Set title attributes

        // Apply to navigation bar
        navBar?.standardAppearance = standardAppearance
        navBar?.scrollEdgeAppearance = scrollEdgeAppearance

        // Optional: Force immediate update
        navBar?.setNeedsLayout()
    }
    
    func loadMessages(){
        db.collection(Constants.FStore.collectionName).order(by: Constants.FStore.dateField).addSnapshotListener{ (querySnapShot, error) in
            self.messages = []
            if let e = error{
                print("Error getting messages!!\(e)")
            }else{
                if let snapshotDocuments = querySnapShot?.documents{
                    for doc in snapshotDocuments{
                        let data = doc.data()
                        if let messageSender = data[Constants.FStore.senderField] as? String, let messageBody = data[Constants.FStore.bodyField] as? String{
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async{
                                self.tableView.reloadData()
                                let index = IndexPath(row: self.messages.count-1, section: 0)
                                self.tableView.scrollToRow(at: index, at: .top, animated: false)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
//        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email{
//            db.collection(Constants.FStore.collectionName).addDocument(data: [Constants.FStore.senderField: messageSender, Constants.FStore.bodyField: messageBody,Constants.FStore.dateField: Date().timeIntervalSince1970]){ error in
//                if let e = error{
//                    print("Issue occured for saving data to firestore!! \(e)")
//                }else{
//                    print("Successfully saved data!")
//                    DispatchQueue.main.async {
//                        self.messageTextfield.text = ""
//                    }
//                }
//            }
//        }
        
        // Get and trim the message text
            let messageText = messageTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            let senderEmail = Auth.auth().currentUser?.email ?? ""
            
            // Only proceed if both fields have content
            if !messageText.isEmpty && !senderEmail.isEmpty {
                db.collection(Constants.FStore.collectionName).addDocument(data: [
                    Constants.FStore.senderField: senderEmail,
                    Constants.FStore.bodyField: messageText,
                    Constants.FStore.dateField: Date().timeIntervalSince1970
                ]) { error in
                    if let e = error {
                        print("Error saving data: \(e)")
                    } else {
                        print("Data saved successfully!")
                        DispatchQueue.main.async {
                            self.messageTextfield.text = ""
                        }
                    }
                }
            } else {
                print("Message is empty or sender not logged in!")
                // Optional: Show alert to user
                let alert = UIAlertController(
                    title: "Cannot Send",
                    message: messageText.isEmpty ? "Please enter a message" : "You need to be logged in",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            let alert = UIAlertController(
                title: "Logout Successful!",
                message: "Thank you for using WinkChat",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                // Wait until alert is dismissed before popping
                self.navigationController?.popToRootViewController(animated: true)
            })
            self.present(alert, animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
}

//MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        
        cell.label.text = message.body
        
        if(message.sender == Auth.auth().currentUser?.email){
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.orange)
        }else{
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.magenta)
        }
        
        return cell
    }
}

//MARK: - UITextFieldDelegate

extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            sendPressed(sendButton)
        return true
    }
}


