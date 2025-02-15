//
//  ExchangeRateViewModel.swift
//  yccurrency
//
//  Created by mac on 9/2/25.
//

import Foundation

class ExchangeRateViewModel: ObservableObject {

    @Published var currencies: [CurrencyModel] = []
    @Published var currency: CurrencyModel?
    @Published var currencyHistory: [CurrencyHistoryModel] = []
    @Published var recentCurrencyHistory: CurrencyHistoryModel?

    
    @MainActor
    func fetchCurrency() async {

        do {
            currencies = try JSONDecoder().decode(
                [CurrencyModel].self, from: sampleCurrencyJSON)
            currency = currencies.first

        } catch (let error) {
            print("Error decoding JSON: \(error)")

        }
    }
    
    @MainActor
    func fetchCurrencyHistory() async {

        do {
            let response = try JSONDecoder().decode(
                CurrencyHistoryResponse.self, from: sampleCurrencyHistoryJson)
            
            currencyHistory = response.data
            recentCurrencyHistory = currencyHistory.filter({ item in
                item.transactions.isEmpty
            })
            .first
            
        } catch (let error) {
            print("Error decoding JSON: \(error)")

        }
    }
}
