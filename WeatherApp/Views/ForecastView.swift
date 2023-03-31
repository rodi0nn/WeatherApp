//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 30/03/2023.
//

import SwiftUI

struct ForecastView: View {
    var body: some View{
        GeometryReader { geo in
            VStack {
                Text("Forecast")
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Image("background").resizable().scaledToFill())
            .ignoresSafeArea()
        }
    }
}

struct Forecast_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
    }
}
