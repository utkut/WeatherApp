//
//  Settings.swift
//  SwiftUIDemo
//
//  Created by Utku Tarhan on 8/12/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//

import SwiftUI

struct Settings: View {
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center, spacing: 5){
                
                
                
                TextField("Enter City"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")).padding()
                VStack(alignment:.center, spacing: 5){
                    
                    
                    Picker(selection: .constant(1), label: Text("Temperature Unit")) /*@START_MENU_TOKEN@*/{
                        Text("Celsius").tag(1)
                        Text("Fahrenheit").tag(2).padding()
                    }/*@END_MENU_TOKEN@*/
                    
                    
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
