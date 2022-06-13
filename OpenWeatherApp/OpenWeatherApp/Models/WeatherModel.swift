//
//  WeatherModel.swift
//  OpenWeatherApp
//
//  Created by Artem Mazurkevich on 11.06.2022.
//

import Foundation

struct WeatherModel: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
