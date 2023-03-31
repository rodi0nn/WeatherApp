//
//  HourlySummaryView.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 30/03/2023.
//

import SwiftUI

struct HourlySummaryView: View {
    
    @State var userLocation: String = "Londra"
    
    var body: some View {
        ZStack {
            Image("background2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                
                Text("Potters Field Park, London, United Kingdom")
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.title)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                List {
                    
                }
            }
        }
    }
}

struct HourlySUmmaryView: PreviewProvider {
    static var previews: some View {
        HourlySummaryView()
    }
}

