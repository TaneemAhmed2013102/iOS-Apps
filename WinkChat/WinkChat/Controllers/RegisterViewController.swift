//
//  RegisterViewController.swift
//  Wink Chat
//
//  Created by Taneem on 12/06/2025.

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarAppearance()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.wink
        emailTextfield.delegate=self
        passwordTextfield.delegate=self
    }
    
    private func setupNavigationBarAppearance() {
        let navBar = navigationController?.navigationBar

        // Create custom appearances
        let standardAppearance = UINavigationBarAppearance()
        let scrollEdgeAppearance = UINavigationBarAppearance()

        // Customize STANDARD appearance (default state)
        standardAppearance.backgroundColor = UIColor(named: Constants.BrandColors.magenta)  // Background color
        standardAppearance.shadowColor = UIColor(named: Constants.BrandColors.magenta)      // Shadow color (line)

        // Customize SCROLL EDGE appearance (when scrolling)
        scrollEdgeAppearance.backgroundColor = UIColor(named: Constants.BrandColors.magenta)// Different background
        scrollEdgeAppearance.shadowColor = UIColor(named: Constants.BrandColors.magenta)    // No shadow

        // Apply to navigation bar
        navBar?.standardAppearance = standardAppearance
        navBar?.scrollEdgeAppearance = scrollEdgeAppearance

        // Optional: Force immediate update
        navBar?.setNeedsLayout()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e)
                    let alert = UIAlertController(
                        title: "Registration Failed!",
                        message: email.isEmpty ? "Enter a valid email address" : "Password needs to have atleast six characters!",
                        preferredStyle: .alert
                    )
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }else{
                    let alert = UIAlertController(
                        title: "Registered Successfully!",
                        message: "Click OK to Log in",
                        preferredStyle: .alert
                    )
                    alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                        // Wait until alert is dismissed before popping
                        self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
                    })
                    self.present(alert, animated: true)
                    
                    
                }
            }
        }
        
    }
    
}

//MARK: - UITextFieldDelegate

extension RegisterViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        registerPressed(registerButton)
        return true
    }
}
