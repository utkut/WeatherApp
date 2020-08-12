//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Utku Tarhan on 6/25/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var height : CGFloat = 1080
    var width : CGFloat = 375
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center, spacing: 80) {
            
        VStack(alignment: .center, spacing: 20) {
            Text("Title")
                        .font(.title)
                        .foregroundColor(.white)
                    .bold()
                    HStack{
                        Text("Big Title")
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .font(.system(size: 50))
                        
                    }
                    Text("Subtitle")
                        .foregroundColor(.white)
                        .font(.body)
                    
        }
        .padding(.all)
        .frame(width: width, height: height)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)),Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        
        
        
        }.navigationBarTitle("")
            
        .navigationBarItems(trailing:
                
    NavigationLink(destination: Settings()) {
        Image(systemName: "gear").imageScale(.large).accentColor(.black)
    })
            
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
