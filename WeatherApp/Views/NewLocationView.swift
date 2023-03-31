//
//  NewLocationView.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 31/03/2023.
//

import SwiftUI
import CoreLocation

struct NewLocationView: View {
    
    @EnvironmentObject var dataModel: DataModel
    
    @State var location: String = ""
    
    @Binding var isSearchOpen: Bool
    @Binding var userLocation: String
    
    var body: some View {
        VStack {
            TextField("Enter New Location:", text: self.$location, onCommit: {
                CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
                    
                    if let lat = placemarks?.first?.location?.coordinate.latitude,
                       let lon = placemarks?.first?.location?.coordinate.longitude {
                        print("For the new location at: \(location), the coordonites are:\nlat = \(lat)\nlon = \(lon)")
                        self.userLocation = location
                        isSearchOpen.toggle()
                        
                    }    
                }
            })
            .padding(10)
            .shadow(color: .blue, radius: 10)
            .cornerRadius(10)
            .fixedSize()
            .font(.custom("Ariel", size: 26))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .cornerRadius(15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.teal.edgesIgnoringSafeArea(.all))
        
    }
}

struct NewLocationView_Previews: PreviewProvider {
    static var previews: some View {
        NewLocationView(isSearchOpen: .constant(false), userLocation: .constant("Londra"))
    }
}
