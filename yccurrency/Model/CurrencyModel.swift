//
//  CurrencyModel.swift
//  yccurrency
//
//  Created by mac on 9/2/25.
//

import Foundation
import SwiftUI

struct CurrencyModel: Identifiable, Codable {
    let id: Int
    let code: String
    let unit: String
    let prices: [Price]

    // Computed properties
    var buyPrice: Double {
        prices[0].numericValue
    }

    var sellPrice: Double {
        prices[1].numericValue
    }

    var buySignIcon: String {
        prices[0].signIcon
    }

    var sellSignIcon: String {
        prices[1].signIcon
    }

    var buySignColor: Color {
        prices[0].signColor
    }
    var sellSignColor: Color {
        prices[1].signColor
    }

    // Get flag emoji based on currency code
    var flag: String {
        switch code {
        case "MMK": return "🇲🇲"
        case "USD": return "🇺🇸"
        case "EUR": return "🇪🇺"
        case "SGD": return "🇸🇬"
        case "THB": return "🇹🇭"
        case "JPY": return "🇯🇵"
        case "MYR": return "🇲🇾"
        case "CNY": return "🇨🇳"
        case "WON": return "🇰🇷"
        case "GBP": return "🇬🇧"
        case "AUD": return "🇦🇺"
        case "CAD": return "🇨🇦"
        case "NTD": return "🇹🇼"
        case "AED": return "🇦🇪"
        case "INR": return "🇮🇳"
        case "HKD": return "🇭🇰"
        case "MOP": return "🇲🇴"
        case "LAK": return "🇱🇦"
        case "VND": return "🇻🇳"
        case "PHP": return "🇵🇭"
        case "KHR": return "🇰🇭"
        default: return "🏳️"
        }
    }
}

