//
//  PollutionView.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 30/03/2023.
//

import SwiftUI

struct PollutionView: View {
    
    @EnvironmentObject var dataModel: DataModel
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text(dataModel.userLocation)
                
                Text("\(dataModel.forecast?.current.temp ?? 0, specifier: "%.1f")ºC")
                
                Label("\(dataModel.forecast?.current.weather.first?.weatherDescription.rawValue.capitalized ?? "Unknown")", image: dataModel.forecast?.current.weather.first?.icon ?? "")
                
                HStack {
                    Text("H: \(dataModel.forecast?.daily.first?.temp.max ?? 0, specifier: "%.1f")ºC")
                        .padding(5)
                        .font(.callout)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                    
                    Text("L: \(dataModel.forecast?.daily.first?.temp.min ?? 0, specifier: "%.1f")ºC")
                        .padding(5)
                        .font(.callout)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }
                
                Text("Feels like: \(dataModel.forecast?.current.feelsLike ?? 0, specifier: "%.1f")ºC")
                
                Text("Air Quality Data")
                
                HStack {
                    Label("SO2", image: "so2")
                    Label("NO2", image: "no")
                    Label("VOC", image: "voc")
                    Label("PM", image: "pm")
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Image("background2").resizable().scaledToFill())
            .ignoresSafeArea()
        }
    }
}

struct PollutionView_Previews: PreviewProvider {
    static var previews: some View {
        let dataModel = DataModel()
        PollutionView()
            .environmentObject(dataModel)
    }
}
