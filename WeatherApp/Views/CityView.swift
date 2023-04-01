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
                    NewLocationView(isSearchOpen: $isSearchOpen, userLocation: $dataModel.userLocation)
                }
                .padding()
                Spacer()
            
                
                Text(dataModel.userLocation)
                    .font(.title)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                    .multilineTextAlignment(.center)
                
                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(dataModel.forecast?.current.dt ?? 0))))
                    .formatted(.dateTime.year().hour().month().day()))
                .padding()
                .font(.largeTitle)
                .foregroundColor(.black)
                .shadow(color: .black, radius: 1)
                
                Spacer()
                
                Text("Temp: \(dataModel.forecast?.current.temp ?? 0, specifier: "%.1f")ºC")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                Text("Humidity: \(dataModel.forecast?.current.humidity ?? 0)%")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                Text("Pressure: \(dataModel.forecast?.current.pressure ?? 0)hPa")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                Label("\(dataModel.forecast?.current.weather.first?.weatherDescription.rawValue.capitalized ?? "Unknown")",
                      systemImage: "\(dataModel.forecast?.current.weather.first?.icon ?? "questionmark.circle")")
                    .padding()
                    .font(.title3)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                

            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Image("background")
                .resizable()
                .scaledToFill()
                .opacity(0.925)
                .ignoresSafeArea())
            .ignoresSafeArea()
        }
    }
}

struct CityView_Preview: PreviewProvider {
    static var previews: some View {
        let dataModel = DataModel()
        CityView()
            .environmentObject(dataModel)
    }
}
