//
//  HourlySummary.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 31/03/2023.
//

import SwiftUI

struct HourlySummary: View {
    var body: some View {
        HStack {
            Spacer()
            Text("date")
            
            Spacer()
            
            Image(systemName: "circle.fill")
            
            Spacer()
            
            Text("condition")
            Spacer()
        }
    }
}

struct HourlySummary_Previews: PreviewProvider {
    static var previews: some View {
        HourlySummary()
    }
}
