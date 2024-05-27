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
        let requestJson = """
        {
           "area": "Tokyo",
            "date": "2020-04-01T12:00:00+09:00"
        }
        """
        
        
        
        
        do {
            let fetchWeatherString = try YumemiWeather.fetchWeather(requestJson)
            print(fetchWeatherString)
            self.delegate?.wetherDate(type: fetchWeatherString)
        } catch {
            self.delegate?.wetherError(message: "エラーだよ")
        }
    }
    
}
