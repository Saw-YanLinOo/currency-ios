//
//  CommaSeparator.swift
//  yccurrency
//
//  Created by mac on 16/2/25.
//

import Foundation

extension Double {
    func formattedWithSeparator() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
