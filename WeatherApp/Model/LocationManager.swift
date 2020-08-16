//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Utku Tarhan on 8/15/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//
//  The code was written for personal/educational purposes on San Francisco State University
//  Does not infringe any conflict of interest with Apple Business Conduct 2020.
//
import Foundation
import CoreLocation


class LocationManager: NSObject, ObservableObject {
    
    override init() {
            super.init()
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.requestLocation()
        }
    @Published var locationStatus: CLAuthorizationStatus? {
           willSet {
               objectWillChange.send()
           }
       }

       @Published var lastLocation: CLLocation? {
           willSet {
               objectWillChange.send()
           }
       }

       var statusString: String {
           guard let status = locationStatus else {
               return "unknown"
           }

           switch status {
           case .notDetermined: return "notDetermined"
           case .authorizedWhenInUse: return "authorizedWhenInUse"
           case .authorizedAlways: return "authorizedAlways"
           case .restricted: return "restricted"
           case .denied: return "denied"
           default: return "unknown"
           }

       }

       private let locationManager = CLLocationManager()
   }

   extension LocationManager: CLLocationManagerDelegate {

       func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           self.locationStatus = status
           print(#function, statusString)
       }

       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           guard let location = locations.last else { return }
           self.lastLocation = location
           print(#function, location)
       }
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to find user's location: \(error.localizedDescription)")
        }

   }

