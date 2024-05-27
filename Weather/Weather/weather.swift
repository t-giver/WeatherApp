//
//  weather.swift
//  Weather
//
//  Created by spark-05 on 2024/05/24.
//

import Foundation
import YumemiWeather




protocol weatherDateSet {
    func wetherDate(type: String)
    func wetherError(message:String)
}


class SetWeather {
    var delegate:weatherDateSet?
    
    func wetherDate() {
        do {
            let fetchWeatherString = try YumemiWeather.fetchWeatherCondition(at: "")
            self.delegate?.wetherDate(type: fetchWeatherString)
        } catch {
            self.delegate?.wetherError(message:"エラーだよ")
        }
    }
    
}
