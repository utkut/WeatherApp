//
//  MapJSON.swift
//  WeatherApp
//
//  Created by Utku Tarhan on 8/12/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//
//  The code was written for personal/educational purposes on San Francisco State University
//  Does not infringe any conflict of interest with Apple Business Conduct 2020.
//
import Foundation
//MARK:- Networking Class
class API {
    
    
    
    // `endpoints` for  rest api
    enum Endpoints {
        
        static let dailyBase = "http://api.openweathermap.org/data/2.5"
        static let locationBase = "http://api.openweathermap.org/data/2.5/"
        
        //MARK:- Get your appid here https://openweathermap.org/api
        static let appid = Secrets.appid //Imports the secrets. Increases the API security.
        
        
        case metric(city:String)
        case imperial(city:String)
        case locationmetric(latitude:String, Longitude:String)
        case locationimperial(latitude:String, Longitude:String)
        
        var stringValue : String {
            
            switch self {
            case .metric(city: let city):
                return   Endpoints.dailyBase + "/weather?q=\(city.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: "%20"))&APPID=" + Endpoints.appid + "&units=metric"
            case .imperial(city: let city):
                return Endpoints.dailyBase + "/weather?q=\(city.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: "%20"))&APPID=" + Endpoints.appid + "&units=imperial"
            case .locationmetric(latitude: let lat, Longitude: let lon):
                return Endpoints.dailyBase + "/weather?lat=\(lat)" + "&lon=\(lon)" + "&APPID=" + Endpoints.appid + "&units=metric"
            case .locationimperial(latitude: let lat, Longitude: let lon):
                return Endpoints.dailyBase + "/weather?lat=\(lat)" + "&lon=\(lon)" + "&APPID=" + Endpoints.appid + "&units=imperial"
            }
        }
        
        var url : URL {
            return URL(string: self.stringValue)!
        }
    }
    
    //MARK:- Get function
    class func getWeather<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    // Current Metric Weather
    class func fetchCurrentmetricWeather(by city : String, completion : @escaping (Weather?)->()){
        let url = Endpoints.metric(city: city).url
        getWeather(url: url, responseType: Weather.self) { (result, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
                return
            }
            completion(result)
        }
    }
    
    // Current Imperial Weather
    class func fetchCurrentimperialWeather(by city : String, completion : @escaping (Weather?)->()){
        let url = Endpoints.imperial(city: city).url
        getWeather(url: url, responseType: Weather.self) { (result, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
                return
            }
            completion(result)
        }
    }
    // Current Metric Weather
    class func fetchCurrentLocationWeatherMetric(latitude : String , longitude: String, completion : @escaping (Weather?)->()){
        let url = Endpoints.locationmetric(latitude: latitude, Longitude: longitude).url
        getWeather(url: url, responseType: Weather.self) { (result, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
                return
            }
            completion(result)
        }
    }
    
    // Current Imperial Weather
    class func fetchCurrentLocationWeatherImperial(longitude : String, latitude: String , completion : @escaping (Weather?)->()){
        let url = Endpoints.locationimperial(latitude: latitude, Longitude: longitude).url
        getWeather(url: url, responseType: Weather.self) { (result, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
                return
            }
            completion(result)
        }
    }
}




