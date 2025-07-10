//
//  WelcomeViewController.swift
//  Wink Chat
//
//  Created by Taneem on 12/06/2025.


import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var logButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden=true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden=false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regButton.layer.cornerRadius = regButton.frame.size.height / 2.5
        regButton.clipsToBounds = true
        logButton.layer.cornerRadius = logButton.frame.size.height / 2.5
        logButton.clipsToBounds = true
        
        titleLabel.text = Constants.appName
        
//        var charIdx = 0
//        let titleText = "😉WinkChat"
//        for i in titleText{
//            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charIdx), repeats: false) { timer in
//                self.titleLabel.text?.append(i)
//            }
//            charIdx += 1
//        }
       
    }
}
