//
//  HourlySummary.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 31/03/2023.
//

import SwiftUI

struct HourlySummary: View {

    var hour: Current
    
    var body: some View {
        HStack {
            Spacer()
            Text(Date(timeIntervalSince1970: TimeInterval((Int)(hour.dt))).formatted(.dateTime.weekday().hour()))
            
            Image(hour.weather.first?.icon ?? "default value")
            
            Text("\(hour.temp, specifier: "%.1f")ºC \(hour.weather.first?.weatherDescription.rawValue.capitalized ?? "Unknown")")
            Spacer()
        }
    }
}

struct HourlySummary_Previews: PreviewProvider {
    static var dataModel = DataModel()
    static var previews: some View {
        HourlySummary(hour: dataModel.forecast!.current)
    }
}
