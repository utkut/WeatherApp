//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Utku Tarhan on 8/12/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//

import SwiftUI


struct CurrentWeather: View {
    
    var weather : Weather?
    var height : CGFloat = 0
    
    var body: some View {
        NavigationView{
        VStack(alignment: .center, spacing: 10) {
            Image(weather?.weather.last?.icon ?? "01d")
                .resizable()
                .frame(width: 130, height: 130)
                .aspectRatio(contentMode: .fit)
            Text("Today in \(weather?.name ?? "Unknown")")
                .font(.title)
                .foregroundColor(.white)
            .bold()
            .padding()
            HStack{
                Text("\(weather?.main.temp ?? 0)°")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 50))
               
            }
            Text("\(weather?.weather.last?.description ?? "Unknown")")
                .foregroundColor(.white)
                .font(.body)
            
        }.frame(width: height, height: height)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)),Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
        .navigationBarItems(trailing:
                                NavigationLink(destination: Settings()) {
                                    Image(systemName: "gear").imageScale(.large).accentColor(.black)
                            })
    }
    }
}

struct currentViewModifier : ViewModifier{
    private var radius : CGFloat = 20
    private var xAxis : CGFloat = 20
    private var yAxis : CGFloat = 20
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(radius)
            .shadow(color: .gray, radius: radius, x: xAxis, y: yAxis)
            .opacity(0.8)
        
    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
       CurrentWeather()
    }
}

