//
//  ViewController.swift
//  OpenWeatherApp
//
//  Created by Artem Mazurkevich on 03.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        WeatherAPIManager.shared.loadWeatherData(lat: 53.9, lon: 27.5667) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
        
        WeatherAPIManager.shared.loadCities(searchText: "Grod") { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}

