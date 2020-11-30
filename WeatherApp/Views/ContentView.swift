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
    @State private var selected = 1
    @ObservedObject var weather = CurrentWeatherViewModel()
    @ObservedObject var locationManager = LocationManager()
    @State var city : String = ""
    var userLatitude: String {
            return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
        }
    
    private var height : CGFloat = UIScreen.main.bounds.height
        var body: some View {
        

            ZStack{
                
                HStack(alignment: .top, spacing: 10){
                        VStack(alignment: .center, spacing: 0){
                            TextField("Enter your city", text: $city, onCommit: {
                                self.weather.fetchmetric(self.city)
                            }) .padding()
                            
                            
                            GeometryReader{ gr in
                                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height : (gr.size.height)).frame(minWidth: 0, maxWidth: .infinity, minHeight: 714, maxHeight: .infinity ,alignment: .center).animation(.easeOut(duration: 0.5))
                                    .lineLimit(nil)
                            }.frame(minWidth: 375,
                                    maxWidth: .infinity,
                                    minHeight: 745,
                                    maxHeight: .infinity,
                                    alignment: .center
                            )
                            
                        }
                }

            }
            
            .onAppear{
                print(Secrets.eula)
                self.weather.fetchmetriclocationdata(lat: userLatitude, lon: userLongitude)
                print(userLatitude + ", " + userLongitude)
                
            }
            
        }
    
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

