//
//  ResultViewController.swift
//  Splity
//
//  Created by Taneem Ahmed on 12/10/24.


import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String?
    var tips: String?
    var person: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = total ?? "0.00"
        settingsLabel.text = "Split between \(person ?? "2") people, with \(tips ?? "0")% tip."
        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
