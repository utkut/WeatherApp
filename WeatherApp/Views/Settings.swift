//
//  Settings.swift
//  SwiftUIDemo
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
    @State var selected : Int = -1
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center, spacing: 35){
                
                VStack(alignment:.center, spacing: 5){
                    
                    
                    Picker(selection: self.$selected, label: Text("Temperature Unit")) {
                        Text("Celsius").tag(1)
                        Text("Fahrenheit").tag(2).padding()
                            .pickerStyle(SegmentedPickerStyle())
                    }
                    
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
