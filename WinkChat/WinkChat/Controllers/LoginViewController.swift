//
//  LoginViewController.swift
//  Wink Chat
//
//  Created by Taneem on 12/06/2025.

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarAppearance()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.wink
        emailTextfield.delegate = self
        passwordTextfield.delegate=self
    }
    
    private func setupNavigationBarAppearance() {
        let navBar = navigationController?.navigationBar

        // Create custom appearances
        let standardAppearance = UINavigationBarAppearance()
        let scrollEdgeAppearance = UINavigationBarAppearance()

        // Customize STANDARD appearance (default state)
        standardAppearance.backgroundColor = UIColor(named: Constants.BrandColors.orange)  // Background color
        standardAppearance.shadowColor = UIColor(named: Constants.BrandColors.orange)      // Shadow color (line)

        // Customize SCROLL EDGE appearance (when scrolling)
        scrollEdgeAppearance.backgroundColor = UIColor(named: Constants.BrandColors.orange)// Different background
        scrollEdgeAppearance.shadowColor = UIColor(named: Constants.BrandColors.orange)    // No shadow

        // Apply to navigation bar
        navBar?.standardAppearance = standardAppearance
        navBar?.scrollEdgeAppearance = scrollEdgeAppearance

        // Optional: Force immediate update
        navBar?.setNeedsLayout()
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                if let e = error{
                    print(e)
                    let alert = UIAlertController(
                        title: "Login Failed!",
                        message: email.isEmpty ? "Enter your email address" : "Wrong password",
                        preferredStyle: .alert
                    )
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }else{
                    self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
                }
            }
        }
        
    }
    
}

//MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginPressed(loginButton)
        return true
    }
}

