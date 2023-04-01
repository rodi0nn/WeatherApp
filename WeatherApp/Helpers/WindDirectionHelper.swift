//
//  WindDirectionHelper.swift
//  WeatherApp
//
//  Created by Cătălin-Iulian Toderașcu-Buia on 31/03/2023.
//

import Foundation

public func degreesToCardinals(deg: Int)->String {
    let cardinalDir = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S","SSW", "SW", "WSW", "W", "WNW", "NW", "NNW", "N"]
    return cardinalDir[Int(round(((Double)(deg % 360)) / 22.5).nextDown) + 1]
}
