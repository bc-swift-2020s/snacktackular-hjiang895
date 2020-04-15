//
//  Double+roundTo.swift
//  Snacktacular
//
//  Created by Hannah Jiang on 4/14/20.
//  Copyright © 2020 John Gallaugher. All rights reserved.
//

import Foundation
//rounds any Double to "places" places

extension Double {
    func roundTo(places: Double) -> Double {
        let tenToPower = pow(10.0, Double((places >= 0 ? places: 0)))
        let roundedValue = (self * tenToPower).rounded()/tenToPower
        return roundedValue
    }
}
