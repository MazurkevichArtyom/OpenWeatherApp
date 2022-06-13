//
//  WeatherData.swift
//  OpenWeatherApp
//
//  Created by Artem Mazurkevich on 11.06.2022.
//

import Foundation

struct CityWeatherModel : Codable {
    let lat: Double
    let lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: CurrentModel
    let daily: [DailyModel]
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, daily
    }
}
