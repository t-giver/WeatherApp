//
//  wetherStruct.swift
//  Weather
//
//  Created by spark-05 on 2024/05/29.
//

import Foundation
import YumemiWeather

//Vc用

struct WeatherData: Codable {
    let area: String
    let date: String
}

struct Weather: Codable{
    let maxTemp: Int
    let minTemp: Int
    let weatherCondition: String
    
    enum CodingKeys: String, CodingKey {
        case maxTemp = "max_temperature"
        case minTemp = "min_temperature"
        case weatherCondition = "weather_condition"
    }
    
}


//List用
struct WetherJson: Codable {
    let areas: [String]
    let date: String
}

struct List: Codable {
    let area: Area
    let info: Weather
}



