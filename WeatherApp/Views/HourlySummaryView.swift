//
//  HourlySummaryView.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 30/03/2023.
//

import SwiftUI

struct HourlySummaryView: View {
    
    @EnvironmentObject var dataModel: DataModel
    
    var body: some View {
        ZStack {
            Image("background2")
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
                    ForEach(dataModel.forecast?.hourly ?? [], id: \.dt) {
                        hourlySummary in
                        HourlySummary(hour: hourlySummary)
                            .background(Color.white)
                    }
                }
                .opacity(0.7)
            }
        }
    }
}

struct HourlySUmmaryView: PreviewProvider {
    static var previews: some View {
        let dataModel = DataModel()
        HourlySummaryView()
            .environmentObject(dataModel)
    }
}

