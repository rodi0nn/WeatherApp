//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 30/03/2023.
//

import SwiftUI

struct ForecastView: View {
    
    @EnvironmentObject var dataModel: DataModel
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                
                Text(dataModel.userLocation)
                    .padding()
                    .lineLimit(3)
                    .font(.title)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                List {
                    ForEach(dataModel.forecast?.daily ?? [], id: \.dt) {
                        dailyForecast in
                        DailyForecast(day: dailyForecast)
                    }
                }
            }
        }
    }
}

struct Forecast_Previews: PreviewProvider {
    static var previews: some View {
        let dataModel = DataModel()
        ForecastView()
            .environmentObject(dataModel)
    }
}
