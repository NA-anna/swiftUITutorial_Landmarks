//
//  Hike.swift
//  landmark
//
//  Created by 나유진 on 2023/02/24.
//

import Foundation
import SwiftUI

struct Hike: Hashable, Codable, Identifiable {
    var name: String
    var id: Int
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    struct Observation: Hashable, Codable {
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRateL: Range<Double>
        var distanceFromStart: Double
    }
}
