//
//  calculatorBrain.swift
//  Splity
//
//  Created by Taneem Ahmed on 12/10/24.

import UIKit

struct CalculatorBrain{
    
    var myData: Data?
    
    mutating func calculate(b: Float, t: Int, p: Int){
        let person = Float(p)
        let totalAmount = b * Float(t+100)/Float(100)
        let myResult = Float(totalAmount)/person
       myData = Data(splittedBill: myResult, tip: t, person: p)
    }
    
    func getSplittedBill() -> String{
        let result1 = String(format: "%.2f", myData?.splittedBill ?? 0.00)
        return result1
    }
    
    func getPerson() -> String{
        let result2 = String(myData?.person ?? 2)
        return result2
    }
    
    func getTips() -> String {
        let result3 = String(myData?.tip ?? 0)
        return result3
    }
    
}

