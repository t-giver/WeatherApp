//
//  weather.swift
//  Weather
//
//  Created by spark-05 on 2024/05/24.
//

import Foundation
import YumemiWeather
import Foundation






protocol weatherDateSet {
    func wetherDate(type: String)
    func wetherError(message:String)
    func maxTemp(max: Int)
    func minTemp(min: Int)
}


class SetWeather {
    var delegate:weatherDateSet?
    
    func wetherDate() {
        let requestJson = """
    {
    "area": "Tokyo",
    "date": "2020-04-01T12:00:00+09:00"
    }
    """
        
        
        do {
            let fetchWeatherString = try YumemiWeather.fetchWeather(requestJson)
            guard let conversionDeta = fetchWeatherString.data(using: .utf8),
                  let json = try JSONSerialization.jsonObject(with: conversionDeta,options: [] )as? [String: Any],
                  let maxTemperature = json["max_temperature"] as? Int,
                  let minTemperature = json["min_temperature"] as? Int,
                  let wetherCondition = json["weather_condition"] as? String
            else{
                return
            }
            self.delegate?.wetherDate(type: wetherCondition)
            self.delegate?.maxTemp(max: maxTemperature)
            self.delegate?.minTemp(min: minTemperature)
            
        } catch {
            self.delegate?.wetherError(message:"エラーだよ")
        }
    }
    
}


