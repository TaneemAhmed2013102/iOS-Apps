//
//  ViewController.swift
//  Tipsy
//
//  Created by Taneem Ahmed on 12/10/2024.


import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNoLabel: UILabel!
    @IBOutlet weak var stepperLabel: UIStepper!
    
    var myBill = CalculatorBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        billTextField.endEditing(true)
        
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
        }else if sender.currentTitle == "10%"{
            tenPctButton.isSelected = true
        }else{
            twentyPctButton.isSelected = true
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let bills = billTextField.text ?? "0.00"
        var tips = 0
        if zeroPctButton.isSelected == true{
            tips = 0
        }
        else if tenPctButton.isSelected == true{
            tips = 10
        }else{
            tips = 20
        }
        let personNo = stepperLabel.value
        
        myBill.calculate(b: Float(bills) ?? 0.00, t: tips, p: Int(personNo))
        
        performSegue(withIdentifier: "goToResult", sender: self)
    
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNoLabel.text = "\(Int(sender.value))"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = "$\(myBill.getSplittedBill())"
            destinationVC.tips = myBill.getTips()
            destinationVC.person = myBill.getPerson()
        }
    }
    

}

