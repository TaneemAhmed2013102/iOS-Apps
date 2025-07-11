//
//  WeatherData.swift
//  Clima
//
//  Created by Taneem Ahmed on 17/10/24.

import Foundation

struct WeatherData: Codable{
    let name: String
    let weather: [Weather]
    let main: Main
}

struct Main: Codable{
    let temp: Double
}

struct Weather: Codable{
    let id: Int
}
