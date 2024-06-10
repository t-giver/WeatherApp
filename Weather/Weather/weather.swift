//  weather.swift
//  Weather
//
//  Created by spark-05 on 2024/05/24.
//

import Foundation
import YumemiWeather


class SetWeather {
    
    func fetchWeather(completion: @escaping (Result<Weather, Error>) -> Void) {
        DispatchQueue.global().async {
            let sendJsonString = WeatherData(area: "Tokyo", date: "2020-04-01T12:00:00+09:00")
            do {
                let encoder = JSONEncoder()
                let jsonData = try encoder.encode(sendJsonString)
                guard let jsonString = String(data: jsonData, encoding: .utf8) else {
                    return
                }
                
                let fetchWeatherString = try YumemiWeather.syncFetchWeather(jsonString)
                
                guard let jsonString = fetchWeatherString.data(using: .utf8) else {
                    return
                }
                
                let decoder = JSONDecoder()
                let weatherStruct = try decoder.decode(Weather.self, from: jsonString)
                completion(.success(weatherStruct))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
    