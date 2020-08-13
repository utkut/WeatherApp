//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Utku Tarhan on 8/12/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//

import Foundation
import Combine

final class CurrentWeatherViewModel : ObservableObject{
    @Published var current : Weather?
    init() {
        DispatchQueue.main.async {
            //if Settings().selected == 0{
                self.fetchmetric()
            //}
           // else{
                self.fetchimperial()
           // }
        }
    }
}

// fetch functions for metric and imperial
extension CurrentWeatherViewModel {
    func fetchmetric(_ city : String = "london"){
        API.fetchCurrentmetricWeather(by: city) {
            self.current = $0
        }
    }
    func fetchimperial(_ city : String = "london"){
        API.fetchCurrentimperialWeather(by: city) {
            self.current = $0
        }
    }
}
