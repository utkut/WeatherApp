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
import MapKit

// Mark:  - Converts input text to CLLocation
class MapClient {
    class func TextToLocation(_ address : String, completion: @escaping (CLLocation?, Error?) -> Void){
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard let placemarks = placemarks, let location = placemarks.first?.location
                else {
                    completion(nil,error)
                    return
            }
            completion(location,nil)
        }
    }
}
