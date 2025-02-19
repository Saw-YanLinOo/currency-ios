//
//  MoneyExchangerModel.swift
//  yccurrency
//
//  Created by mac on 19/2/25.
//
import Foundation
import SwiftUI

struct MoneyExchangerModel: Identifiable, Codable {
    let id: Int
    let name: String
    let role: String
    let profileImage: String
    let contacts: [Contact]
    let rates: [ExchangeRate]
    let paymentMethods: [String]  // Now contains image asset names

    // Computed property to map string names to ImageResource values
    var paymentType: [ImageResource] {
        paymentMethods.compactMap { mapPaymentMethod($0) }
    }

}
func mapPaymentMethod(_ name: String) -> ImageResource? {
    switch name {
    case "krungthai": return .krungthaiBankIcon
    case "bangkok_bank": return .bangkokBankIcon
    case "k_plus": return .kplusIcon
    case "scb": return .scbPay
    case "cb_pay": return .cbPay
    case "aya_pay": return .ayaPayIcon
    case "kbz_pay": return .kpayIcon
    case "wave_money": return .waveIcon
    default: return nil
    }
}
struct Contact: Codable {
    let number: String
    let countryCode: String
}

struct ExchangeRate: Codable {
    let fromCurrency: String
    let toCurrency: String
    let amount: Double
}
