//
//  Settings.swift
//  WeatherApp
//
//  Created by Utku Tarhan on 8/12/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//
//  The code was written for personal/educational purposes on San Francisco State University
//  Does not infringe any conflict of interest with Apple Business Conduct 2020.
//
import SwiftUI

struct Settings: View {
    
    @State var city : String = ""
    @State var selected : Int = 0
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center, spacing: 5){
                
                VStack(alignment:.center, spacing: 5){
                    
                    
                    Picker(selection: $selected, label: Text("Temperature Unit")) {
                        Text("Celsius").tag(0)
                        Text("Fahrenheit").tag(1)
                            .pickerStyle(SegmentedPickerStyle())
                        }
                            
                            .padding()
                    
                    
                }
            }
        }
        .navigationBarTitle("Settings")
        
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
}
