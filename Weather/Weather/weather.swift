//  weather.swift
//  Weather
//
//  Created by spark-05 on 2024/05/24.
//

import Foundation
import YumemiWeather





protocol weatherDateSet {
    func wetherError(message: String)
    func weatherDateCollection(weather: Weather)
}

class SetWeather {
    var delegate: weatherDateSet?
    func wetherDate() {
        let sendJsonString = Date(area: "Tokyo", date: "2020-04-01T12:00:00+09:00")
        
        do {
            let encoder = JSONEncoder()         //エンコード
            let jsonData = try encoder.encode(sendJsonString)
            guard let jsonString = String(data: jsonData, encoding: .utf8)
            else {
                return
            }
            
            let fetchWeatherString = try YumemiWeather.fetchWeather(jsonString)
            guard let jsonString = fetchWeatherString.data(using: .utf8)            //データ変換
            else{
                return
            }
            
            let decoder = JSONDecoder()             //デコード
            let weatherStruct = try decoder.decode(Weather.self, from: jsonString)
            self.delegate?.weatherDateCollection(weather: weatherStruct)
        }
        catch {
            self.delegate?.wetherError(message: "エラーだよ")
        }
    }
}
