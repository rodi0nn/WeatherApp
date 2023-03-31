//
//  WeatherNowView.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 30/03/2023.
//

import SwiftUI

struct WeatherNowView: View {
    
    @EnvironmentObject var dataModel: DataModel
    
    @State var temp: Float = 0
    @State var weatherDescription: String = "Broken Clouds"
    @State var highTemp: Float = 0
    @State var lowTemp: Float = 0
    @State var feelTemp: Float = 0
    @State var windSpeed: Int = 0
    @State var windDirection: String = "SE"
    @State var humidity: Int = 0
    @State var pressure: Int = 0
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text(dataModel.userLocation)
                    .font(.title)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                    .multilineTextAlignment(.center)
                
                Text("\(temp, specifier: "%.1f")ºC")
                    .padding()
                    .font(.largeTitle)
                
                Label("\(weatherDescription)", systemImage: "")
                    .padding()
                    .font(.title3)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                HStack {
                    Text("H: \(highTemp, specifier: "%.1f")ºC")
                        .padding(5)
                        .font(.callout)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                    
                    Text("L: \(lowTemp, specifier: "%.1f")ºC")
                        .padding(5)
                        .font(.callout)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }
                
                Text("Feels like: \(feelTemp, specifier: "%.1f")ºC")
                    .padding(.bottom, 12.0)
                    .font(.callout)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                HStack {
                    Text("Wind Speed: \(windSpeed)m/s")
                        .padding()
                        .font(.headline)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                    
                    Spacer()
                    
                    Text("Direction: \(windDirection)")
                        .padding()
                        .font(.headline)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }
                
                HStack {
                    Text("Humidity: \(humidity)%")
                        .padding()
                        .font(.headline)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                    
                    Spacer()
                    
                    Text("Pressure: \(pressure) hPg")
                        .padding()
                        .font(.headline)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }
                
                HStack {
                    Label("Sunrise", systemImage: "")
                        .padding(5)
                        .font(.headline)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                    
                    Label("Sunset", systemImage: "")
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
        WeatherNowView()
    }
}
