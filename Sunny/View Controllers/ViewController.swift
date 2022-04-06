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
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            self.networkWeatherMenager.fetchCurrentWeather(forCity: city)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherMenager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        networkWeatherMenager.fetchCurrentWeather(forCity: "London")
    }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTemperatureLabel.text = weather.feelsLikeTemperatureString
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
    
}

