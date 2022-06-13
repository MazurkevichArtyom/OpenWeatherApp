//
//  WeatherAPIManager.swift
//  OpenWeatherApp
//
//  Created by Artem Mazurkevich on 12.06.2022.
//

import Foundation

class WeatherAPIManager {
    
    private let weatherApiKey = "cbe7a519e17b1584b6bebf913fbf9cd9"
    private let citySearchApiKey = "439d4b804bc8187953eb36d2a8c26a02"
    
    static let shared = WeatherAPIManager()
    
    func loadWeatherData(lat: Double, lon: Double, completion: @escaping (Result<CityWeatherModel, Error>) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(String(format: "%g", lat))&lon=\(String(format: "%g", lon))&units=metric&exclude=minutely,hourly&appid=\(weatherApiKey)")
        loadData(url: url, completion: completion)
    }
    
    func loadCities(searchText: String, completion: @escaping (Result<SearchModel, Error>) -> Void) {
        let url = URL(string: "https://openweathermap.org/data/2.5/find?q=\(searchText)&type=like&sort=population&cnt=30&appid=\(citySearchApiKey)")
        loadData(url: url, completion: completion)
    }
    
    private func loadData<T: Codable>(url: URL?, completion: @escaping (Result<T, Error>) -> Void) {
        if let url = url {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, responseError in
                if let error = responseError {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                } else {
                    if let data = data {
                        do {
                            let response = try JSONDecoder().decode(T.self, from: data);
                            DispatchQueue.main.async {
                                completion(.success(response))
                            }
                        } catch {
                            DispatchQueue.main.async {
                                completion(.failure(error))
                            }
                        }
                    }
                }
            }
            task.resume()
        } else {
            DispatchQueue.main.async {
                completion(.failure(URLError(URLError.Code.badURL)))
            }
        }
    }
}
