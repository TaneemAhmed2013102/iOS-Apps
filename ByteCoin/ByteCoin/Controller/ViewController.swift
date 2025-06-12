//
//  ViewController.swift
//  ByteCoin
//
//  Created by Taneem on 11/06/2025.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
}

//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate{
    
    func didFailWithError(error: any Error) {
        print(error)
    }
    
    func didUpdateRates(_ coinManager: CoinManager, _ rate: Double, _ currency: String) {
        DispatchQueue.main.async{
            self.bitcoinLabel.text = "\(rate)"
            self.currencyLabel.text = currency
        }
    }
}

//MARK: - UIPickerViewDataSource & UIPickerViewDelegate

extension ViewController: UIPickerViewDataSource,UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(coinManager.currencyArray[row])
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
    }
}






