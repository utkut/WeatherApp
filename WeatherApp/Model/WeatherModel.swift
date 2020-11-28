//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Utku Tarhan on 8/12/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//
//  The code was written for personal/educational purposes on San Francisco State University
//  Does not infringe any conflict of interest with Apple Business Conduct 2020.
//
import Foundation
import Combine

final class CurrentWeatherViewModel : ObservableObject {
    @Published var current : Weather?
    @Published var color: String = "defaultStatus"
    
    init() {
        DispatchQueue.main.async {
            if Settings().selected == 0 && LocationManager().statusString == "denied"{
                self.fetchmetric()
            }
            
            if Settings().selected == 0 && LocationManager().statusString == "authorizedWhenInUse" {
                
            }
            
            if Settings().selected == 1 {
                self.fetchimperial()
            
            if Settings().selected == 1 && LocationManager().statusString == "authorizedWhenInUse" {
            }
           }
        }
    }
}

// fetch functions for metric and imperial and set color at the home screen

extension CurrentWeatherViewModel {
    func fetchmetric(_ city : String = "") {
        let icon = current?.weather.last?.icon
        API.fetchCurrentmetricWeather(by: city) { weather in
            // Work In Progress
            DispatchQueue.main.async {
                self.current = weather
                self.color = self.backgroundColor(code: icon ?? "aaa")
            }
        }
    }
    
    func fetchimperial(_ city : String = ""){
        let icon = current?.weather.last?.icon
        API.fetchCurrentimperialWeather(by: city) { weather in
            DispatchQueue.main.async {
                self.current = weather
                self.color = self.backgroundColor(code: icon ?? "aaa")
            }
        }
    }
    
    
    func backgroundColor(code : String) -> String {
        
        switch code {
            case "01d":
                return "Clear"
            case "02d":
                return "Partly cloudy"
            case "02n":
                return "Partly cloudy"
            case "03d":
                return "Cloudy"
            case "03n":
                return "Cloudy"
            case "04d":
                return "Broken clouds"
            case "04n":
                return "Broken clouds"
            case "09d":
                return "Moderate Rain"
            case "09n":
                return "Heavy rain"
            case "10d":
                return "Moderate Rain"
            case "10n":
                return "Heavy rain"
            case "11d":
                return "Thunderstorm"
            case "11n":
                return "Thunderstorm"
            case "13d":
                return "Snow"
            case "13n":
                return "Snow"
            case "50d":
                return "Mist"
            case "50n":
                return "Mist"
            default:
                return "defaultStatus"
            }
        }
        
}
