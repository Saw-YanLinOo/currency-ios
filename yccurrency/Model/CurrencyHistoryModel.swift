//
//  CurrencyHistoryModel.swift
//  yccurrency
//
//  Created by mac on 9/2/25.
//
import Foundation
import SwiftUI

struct CurrencyHistoryModel: Codable, Identifiable {
    let date: String
    let transactions: [Transaction]
    
    // Computed id for Identifiable conformance
    var id: String { date }
    
    // Formatted date for display
    var formattedDate: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMM dd, yyyy"
        
        if let date = inputFormatter.date(from: date) {
            return outputFormatter.string(from: date)
        }
        return date
    }
}

struct Transaction: Codable, Identifiable {
    let time: String
    let unit: String
    let prices: [Price]
    
    // Generated id for Identifiable conformance
    var id: String { time }
    
    // Formatted time for display
    var formattedDateTime: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "hh:mm a"
        
        if let date = inputFormatter.date(from: time) {
            return inputFormatter.string(from: date)
        }
        return time
    }
    
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

}
