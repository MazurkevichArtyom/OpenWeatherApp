//
//  SearchModel.swift
//  OpenWeatherApp
//
//  Created by Artem Mazurkevich on 13.06.2022.
//

import Foundation

struct SearchModel: Codable {
    let message, cod: String
    let count: Int
    let list: [CityModel]
}
