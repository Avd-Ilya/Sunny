//
//  NetworkWeatherMenager.swift
//  Sunny
//
//  Created by Avdeev Ilya Aleksandrovich on 05.04.2022.
//

import Foundation

struct NetworkWeatherMenager {
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let sesseiom = URLSession(configuration: .default)
        let task = sesseiom.dataTask(with: url) { data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
            }
        }
        task.resume()
    }
}
