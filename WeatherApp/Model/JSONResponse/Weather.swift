//
//  Weather.swift
//  WeatherApp
//
//  Created by Utku Tarhan on 8/12/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//
//  The code was written for personal/educational purposes on San Francisco State University
//  Does not infringe any conflict of interest with Apple Business Conduct 2020.
//
import Foundation

struct Weather: Codable {
    let id, timezone, cod, dt : Int?
    let name , base : String?
    let coord : Coord
    let weather : [WeatherData]
    let main : Main
    let wind : Wind
    let sys : Sys
}

struct Coord : Codable {
    let lon, lat : Double?
}

struct WeatherData : Codable, Identifiable {
    let id : Int?
    let main, description, icon : String?
}

struct Main: Codable {
    var temp, temp_min, temp_max, feels_like : Double?
    let pressure, humidity : Int?
}

struct Wind : Codable {
    let speed : Double?
    let deg : Int?
}

struct Clouds : Codable{
    let all : Int?
}

struct Sys: Codable {
    let type, id, sunrise, sunset : Int?
    let country : String?
}
