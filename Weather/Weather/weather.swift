//  weather.swift
//  Weather
//
//  Created by spark-05 on 2024/05/24.
//

import Foundation
import YumemiWeather

struct Date: Codable {
    let area: String
    let date: String
}

struct weatherDateCollection: Codable{
    let maxTemp: Int
    let minTemp: Int
    let weatherCondition: String
    
    enum CodingKeys: String, CodingKey {
        case maxTemp = "max_temperature"
        case minTemp = "min_temperature"
        case weatherCondition = "weather_condition"
    }
    
}

//struct TEST: Codable{
//    let max_temperature: Int
//
//}

protocol weatherDateSet {
    func wetherError(message: String)
    func weatherDateCollection(maxTemp: Int, minTemp: Int, weatherCondition: String)
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
            let weatherCollection = try decoder.decode(weatherDateCollection.self, from: jsonString)
            
            let max = weatherCollection.maxTemp
            let min = weatherCollection.minTemp
            
            guard let json = try JSONSerialization.jsonObject(with: Data(fetchWeatherString.utf8), options: []) as? [String: Any]
            else {
                return
            }
            
            self.delegate?.weatherDateCollection(maxTemp: max, minTemp: min, weatherCondition: "weather_condition")
            
            
        } catch {
            self.delegate?.wetherError(message: "エラーだよ")
        }
    }
}
