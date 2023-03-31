//
//  CityView.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 30/03/2023.
//

import SwiftUI
import CoreLocation

struct CityView: View {
    
    @EnvironmentObject var dataModel: DataModel
    
    @State var isSearchOpen: Bool = false
    @State var userLocation: String = ""
    @State var userDate: Date = Date(timeIntervalSince1970: 1678829219)
    @State var temp: Float = 0
    @State var humidity: Int = 0
    @State var pressure: Int = 0
    @State var weatherDescription: String = ""
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                Spacer()

                Button {
                    print("change location")
                    // cod pt schimbarea locatiei
                    self.isSearchOpen.toggle()
                } label: {
                    Text("Change Location")
                        .bold()
                        .font(.system(size: 30))
                }
                .sheet(isPresented: $isSearchOpen) {
                    NewLocationView(isSearchOpen: $isSearchOpen, userLocation: $userLocation)
                }
                .padding()
                Spacer()
            
                
                Text(dataModel.userLocation)
                    .font(.title)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                    .multilineTextAlignment(.center)
                
                Text(userDate.formatted(.dateTime.year().hour().month().day()))
                .padding()
                .font(.largeTitle)
                .foregroundColor(.black)
                .shadow(color: .black, radius: 1)
                
                Spacer()
                
                Text("Temp: \(temp, specifier: "%.1f")ºC")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                Text("Humidity: \(humidity)%")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                Text("Pressure: \(pressure)hPa")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                Label("\(weatherDescription)", systemImage: "")
                    .padding()
                    .font(.title3)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                

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

struct CityView_Preview: PreviewProvider {
    static var previews: some View {
        CityView(
            userLocation: "Tooley Street, London, United Kingdom",
            userDate: Date(timeIntervalSince1970: 1678829219),
            temp: 4.98,
            humidity: 82,
            pressure: 1011,
            weatherDescription: "Broken Clouds")
    }
}
