//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Taneem on 11/06/2025.

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(error: Error)
    func didUpdateRates(_ coinManager: CoinManager, _ rate: Double, _ currency: String)
}

struct CoinManager {
    
    let baseURL = "https://min-api.cryptocompare.com/data/price?fsym=BTC"
    let apiKey = "875b2de4547e85b9b18f2aae5ea4deb963a356e0a3e66ed11f817c6c059f9dc3"
    
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)&tsyms=\(currency)&apikey=\(apiKey)"
        
        //Networking
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                //Format the data we got back as a string to be able to print it.
                //let dataAsString = String(data: data!, encoding: .utf8)
                //print(dataAsString!)
                
                if let safeData = data {
                    if let rate = self.parseJSON(safeData) {
                        self.delegate?.didUpdateRates(self, rate, currency)
                    }
                }
            }
            task.resume()
        }
    }
        
    func parseJSON(_ cryptoData: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            // Decode into a dictionary where key is currency code (String) and value is price (Double)
            let decodedData = try decoder.decode([String: Double].self, from: cryptoData)
            
            // Since there's only one key-value pair, we can get the first one
            guard let (_, price) = decodedData.first else {
                return nil
            }
            return price
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
