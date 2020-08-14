//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Utku Tarhan on 6/25/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()
    @State var city : String = ""
    private var height : CGFloat = UIScreen.main.bounds.height
        var body: some View {
            VStack{
                HStack{
                    TextField("Enter your city", text: $city){
                    self.weather.fetchmetric(self.city)
                    }.padding(.horizontal)
                    
                }
                    GeometryReader{ gr in
                        CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height : (gr.size.height*0.75)).frame(width: 375.0, height: 770).modifier(currentViewModifier()).animation(.easeInOut(duration: 0.5))
                    }
                    
            }.frame(width: 375, height: 735, alignment: .center)
            
        
            
        }
    }


    // this is an extension to make our Double as a whole nnumber without decimal value
    extension Double {
        var round: Int {
            return Int(self)
        }
    }
  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
