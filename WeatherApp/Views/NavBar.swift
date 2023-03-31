//
//  NavBar.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 30/03/2023.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        TabView {
            CityView().tabItem {
                Label("City", systemImage: "magnifyingglass")
            }
            WeatherNowView().tabItem {
                Label("Weather Now", systemImage: "sun.max.fill")
            }
            HourlySummaryView().tabItem {
                Label("Hourly Summary", systemImage: "clock.fill")
            }
            ForecastView().tabItem {
                Label("Forecast", systemImage: "calendar")
            }
            PollutionView().tabItem {
                Label("Pollution", systemImage: "aqi.high")
            }
        }.onAppear {
            UITabBar.appearance().isTranslucent = false
        }

    }
}

struct NavBar_Preview: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
