//
//  ViewController.swift
//  Sunny
//
//  Created by Avdeev Ilya Aleksandrovich on 04.04.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    let networkWeatherMenager = NetworkWeatherMenager()

    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
            self.networkWeatherMenager.fetchCurrentWeather(forCity: city)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherMenager.onCompletion = { currentWeather in
            print(currentWeather.cityName)
        }
        networkWeatherMenager.fetchCurrentWeather(forCity: "London")
    }
    
}

