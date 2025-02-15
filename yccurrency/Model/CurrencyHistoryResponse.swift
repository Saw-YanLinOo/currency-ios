//
//  CurrencyHistoryResponse.swift
//  yccurrency
//
//  Created by mac on 9/2/25.
//

import Foundation

struct CurrencyHistoryResponse: Codable {
    let nextStartDate: String
    let data: [CurrencyHistoryModel]
}
