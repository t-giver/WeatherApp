//
//  wetherList.swift
//  Weather
//
//  Created by spark-05 on 2024/06/03.
//

import Foundation
import YumemiWeather

class SendList {
    let allAreas = Area.allCases.map { $0.rawValue }
    func dataList(completion: @escaping (Result<[List],Error>) -> Void) {
        DispatchQueue.global().async{
            let date = Date().ISO8601Format()
            let sendJsonDataString = WetherJson(areas: self.allAreas, date: date)
            do{
                let encoder = JSONEncoder()
                let jsonData = try encoder.encode(sendJsonDataString)
                guard let jsonString = String(data:jsonData,encoding: .utf8) else {
                    return
                }
            
                let wetherList = try YumemiWeather.syncFetchWeatherList(jsonString)
                guard let jsonString = wetherList.data(using: .utf8)
                else {
                    return
                }
                
                let decoder = JSONDecoder()
                let listStruct = try decoder.decode([List].self, from: jsonString)
                completion(.success(listStruct))
            }catch{
                completion(.failure(error))
            }
        }
    }
}
