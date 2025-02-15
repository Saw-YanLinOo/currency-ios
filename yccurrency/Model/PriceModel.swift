//
//  PriceModel.swift
//  yccurrency
//
//  Created by mac on 9/2/25.
//

import Foundation
import SwiftUI

struct Price: Codable {
    let value: String
    let sign: String

    // Convert string value to Double
    var numericValue: Double {
        let cleanValue = value.replacingOccurrences(of: ",", with: "")
        return Double(cleanValue) ?? 0.0
    }

    // Formatted value with commas and 2 decimal places
    var formattedValue: String {
        let number = numericValue
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: number)) ?? value
    }

    // SF Symbol for the sign
    var signIcon: String {
        switch sign {
        case "none": return "minus.circle.fill"
        case "up": return "arrow.up.forward.circle.fill"
        case "down": return "arrow.down.forward.circle.fill"
        default: return "minus.circle.fill"
        }
    }

    // Color for the sign
    var signColor: Color {
        switch sign {
        case "none": return .gray.opacity(0.7)
        case "up": return .green.opacity(0.7)
        case "down": return .red.opacity(0.7)
        default: return .gray.opacity(0.7)
        }
    }
}
