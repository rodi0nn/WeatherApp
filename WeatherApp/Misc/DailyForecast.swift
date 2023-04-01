//
//  DailyForecast.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 01/04/2023.
//

import SwiftUI

struct DailyForecast: View {
    
    var day: Daily
    
    var body: some View {
        HStack {
            Image(day.weather.first?.icon ?? "default value")
            
            VStack {
                Text(day.weather.first?.weatherDescription.rawValue.capitalized ?? "")
                
                Text(Date(timeIntervalSince1970: TimeInterval((Int)(day.dt))).formatted(.dateTime.weekday(.wide).day()))
            }
            
            Text("\(day.temp.min , specifier: "%.1f")ºC / \(day.temp.max , specifier: "%.1f")ºC")
        }
    }
}

struct DailyForecast_Previews: PreviewProvider {
    static var dataModel = DataModel()
    static var previews: some View {
        DailyForecast(day: (dataModel.forecast?.daily.first!)!)
    }
}
