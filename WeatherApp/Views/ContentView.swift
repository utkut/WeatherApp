//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Utku Tarhan on 6/25/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//
//  The code was written for personal/educational purposes on San Francisco State University
//  Does not infringe any conflict of interest with Apple Business Conduct 2020.
//
import SwiftUI
import CoreLocation

struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()
    
    @ObservedObject var locationManager = LocationManager()
    var userLatitude: String {
            return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
        }
    var userLongitude: String {
            return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
        }
    @State var city : String = ""
    private var height : CGFloat = UIScreen.main.bounds.height
        var body: some View {
            NavigationView{
        
            GeometryReader{ gr in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height : (gr.size.height*1)).frame(width: 375.0, height: 900).modifier(currentViewModifier()).animation(.easeInOut(duration: 0.5))
                    
                    }.frame(width: 375, height: 790, alignment: .center)
                    .ignoresSafeArea()
                .navigationBarItems(leading:
                NavigationLink(destination: Settings()) {
                Image(systemName: "gear").imageScale(.large)
                },
                    trailing: TextField("Enter your city", text: $city){
                        self.weather.fetchmetric(self.city)
                    }
                    .padding(.leading))
            }.ignoresSafeArea()
            .onAppear{
                self.weather.fetchLocationMetric(userLatitude, userLongitude)
            }
        }
}

  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

