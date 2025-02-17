//
//  DateFormatter.swift
//  yccurrency
//
//  Created by mac on 9/2/25.
//
import Foundation

extension DateFormatter {
    static let shortFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM, yyyy"
        return formatter
    }()

    static let longFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy 'at' h:mm a"
        return formatter
    }()

    static let currencyHistoryApiDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
