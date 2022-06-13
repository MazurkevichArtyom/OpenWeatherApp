//
//  CityModel.swift
//  OpenWeatherApp
//
//  Created by Artem Mazurkevich on 13.06.2022.
//

import Foundation

struct CityModel: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let dt: Int
    let sys: Sys
}

struct Sys: Codable {
    let country: String
}

struct Coord: Codable {
    let lat, lon: Double
}
