//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Utku Tarhan on 8/12/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//

import SwiftUI
import UIKit

struct CurrentWeather: View {
    // Added color themes for potential weather scenarios
    let bgColors = [
        "Clear":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.6544341662, green: 0.9271220419, blue: 0.9764705896, alpha: 1)), Color( #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Sunny":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), Color( #colorLiteral(red: 0.9529411793, green: 0.8685067713, blue: 0.1800223484, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Partly cloudy":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.5644291786, green: 0.6156922265, blue: 0.8125274491, alpha: 1)), Color( #colorLiteral(red: 0.3611070699, green: 0.3893437324, blue: 0.5149981027, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Cloudy":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.5088317674, green: 0.5486197199, blue: 0.7256778298, alpha: 1)), Color( #colorLiteral(red: 0.3843137255, green: 0.4117647059, blue: 0.5450980392, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Broken clouds":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.4714559888, green: 0.41813849, blue: 0.4877657043, alpha: 1)), Color( #colorLiteral(red: 0.3823538819, green: 0.3384427864, blue: 0.3941545051, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Mist":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.8536048541, green: 0.8154317929, blue: 0.6934956985, alpha: 1)), Color( #colorLiteral(red: 0.5, green: 0.3992742327, blue: 0.3267588525, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Patchy rain possible":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.422871705, green: 0.486337462, blue: 0.7241632297, alpha: 1)), Color(#colorLiteral(red: 0.3826735404, green: 0.4012053775, blue: 0.9529411793, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Patchy snow possible":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.8229460361, green: 0.8420813229, blue: 0.9764705896, alpha: 1)), Color( #colorLiteral(red: 0.6424972056, green: 0.9015246284, blue: 0.9529411793, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Patchy sleet possible":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.9764705896, green: 0.7979655136, blue: 0.9493740175, alpha: 1)), Color( #colorLiteral(red: 0.6843526756, green: 0.7806652456, blue: 0.9529411793, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Patchy freezing drizzle possible":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.6207757569, green: 0.9686274529, blue: 0.9110963382, alpha: 1)), Color( #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Thundery outbreaks possible":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color( #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Blowing snow":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), Color( #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Thunderstorm":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.9551106616, green: 0.9764705896, blue: 0.9351792135, alpha: 1)), Color( #colorLiteral(red: 0.6891936611, green: 0.7095901305, blue: 0.9529411793, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Fog":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.6324083141, green: 0.8039215803, blue: 0.7850640474, alpha: 1)), Color( #colorLiteral(red: 0.4545597353, green: 0.393878495, blue: 0.5369011739, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Freezing fog":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color( #colorLiteral(red: 0.4545597353, green: 0.393878495, blue: 0.5369011739, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Patchy light drizzle":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.5892893535, green: 0.7170531098, blue: 0.9764705896, alpha: 1)), Color( #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Light rain":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color( #colorLiteral(red: 0.2854045624, green: 0.4267300284, blue: 0.6992385787, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Moderate rain":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.3437546921, green: 0.6157113381, blue: 0.7179171954, alpha: 1)), Color( #colorLiteral(red: 0.4118283819, green: 0.5814552154, blue: 0.6975531409, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Heavy rain":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color( #colorLiteral(red: 0.1596036421, green: 0, blue: 0.5802268401, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Light freezing rain":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.7433765433, green: 0.9529411793, blue: 0.8886958889, alpha: 1)), Color( #colorLiteral(red: 0.4561494407, green: 0.6342332627, blue: 0.7568627596, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "Heavy rain at times":LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color( #colorLiteral(red: 0.1596036421, green: 0, blue: 0.5802268401, alpha: 1))]), startPoint: .top, endPoint: .bottom),
        "defaultStatus":LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)),Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))]), startPoint: .top, endPoint: .bottom)
    ]
    
    var weather : Weather?
    var height : CGFloat = 0
    var model: CurrentWeatherViewModel?
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
        .background(bgColors[self.model?.color ?? "defaultStatus"])
            
        .navigationBarItems(trailing:
                                NavigationLink(destination: Settings()) {
                                    Image(systemName: "gear").imageScale(.large).accentColor(.black)
                            })
        }.onAppear {} // Code Execution at startup
    }
}

struct currentViewModifier : ViewModifier{
    private var radius : CGFloat = 20
    private var xAxis : CGFloat = 20
    private var yAxis : CGFloat = 20
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(radius)
            
            .opacity(1.0)
        
    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather()
    }
}

