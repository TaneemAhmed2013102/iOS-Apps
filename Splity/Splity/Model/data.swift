//
//  data.swift
//  Splity
//
//  Created by Taneem Ahmed on 12/10/24.

struct Data{
    
    let splittedBill: Float?
    let tip: Int?
    let person: Int?
    
    init(splittedBill: Float?, tip: Int?, person: Int?) {
        self.splittedBill = splittedBill
        self.tip = tip
        self.person = person
    }

}

