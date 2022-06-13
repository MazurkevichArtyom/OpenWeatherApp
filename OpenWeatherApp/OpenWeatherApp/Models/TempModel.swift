//
//  TempModel.swift
//  OpenWeatherApp
//
//  Created by Artem Mazurkevich on 11.06.2022.
//

import Foundation

struct TempModel: Codable {
   let day, min, max, night: Double
   let eve, morn: Double
}
