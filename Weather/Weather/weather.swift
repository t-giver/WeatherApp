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
}


class SetWeather {
    var delegate:weatherDateSet?
    
    func wetherDate() {
        let fetchWeatherString = YumemiWeather.fetchWeatherCondition()
        delegate?.wetherDate(type: fetchWeatherString)
    }
 
}

//class WeatherPrint {
//    var delegate:weatherDateSet?
//}
