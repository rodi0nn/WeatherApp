//
//  WeatherNowView.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 30/03/2023.
//

import SwiftUI

struct WeatherNowView: View {
    
    @EnvironmentObject var dataModel: DataModel
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text(dataModel.userLocation)
                    .font(.title)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                    .multilineTextAlignment(.center)
                
                Text("\(dataModel.forecast?.current.temp ?? 0, specifier: "%.1f")ºC")
                    .padding()
                    .font(.largeTitle)
                
                Label("\(dataModel.forecast?.current.weather.first?.weatherDescription.rawValue.capitalized ?? "Unknown")",
                      systemImage: "\(dataModel.forecast?.current.weather.first?.icon ?? "questionmark.circle")")
                
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
                    .padding(.bottom, 12.0)
                    .font(.callout)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                HStack {
                    Text("Wind Speed: \(dataModel.forecast?.current.windSpeed ?? 0, specifier: "%.0f")m/s")
                        .padding()
                        .font(.headline)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                    
                    Spacer()
                    
                    Text("Direction: \(degreesToCardinals(deg: dataModel.forecast?.current.windDeg ?? 0))")
                        .padding()
                        .font(.headline)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }
                
                HStack {
                    Text("Humidity: \(dataModel.forecast?.current.humidity ?? 0)%")
                        .padding()
                        .font(.headline)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                    
                    Spacer()
                    
                    Text("Pressure: \(dataModel.forecast?.current.pressure ?? 0) hPg")
                        .padding()
                        .font(.headline)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }

                HStack {
                    Label("\(Date(timeIntervalSince1970: TimeInterval(dataModel.forecast?.daily.first?.sunrise ?? 0)).formatted(date: .omitted, time: .shortened))",
                    systemImage: "")
                        .padding(5)
                        .font(.headline)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                    
                    Label("\(Date(timeIntervalSince1970: TimeInterval(dataModel.forecast?.daily.first?.sunset ?? 0)).formatted(date: .omitted, time: .shortened))", systemImage: "")
                        .padding(5)
                        .font(.headline)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Image("background")
                .resizable()
                .scaledToFill()
                .opacity(0.925))
            .ignoresSafeArea()
        }
    }
}

struct WeatherNowView_Previews: PreviewProvider {
    static var previews: some View {
        let dataModel = DataModel()
        WeatherNowView()
            .environmentObject(dataModel)
    }
}
