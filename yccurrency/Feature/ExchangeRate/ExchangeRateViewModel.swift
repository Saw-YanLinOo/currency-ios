//
//  ExchangeRateViewModel.swift
//  yccurrency
//
//  Created by mac on 9/2/25.
//

import Combine
import Foundation

enum TransactionType {
    case buy
    case sell
}

func formatDouble(_ value: Double) -> String {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 0  // No decimal if not needed
    formatter.maximumFractionDigits = 2  // Up to 2 decimal places

    return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
}

class ExchangeRateViewModel: ObservableObject {

    @Published var currencies: [CurrencyModel] = []
    @Published var currencyHistory: [CurrencyHistoryModel] = []
    @Published var recentCurrencyHistory: CurrencyHistoryModel?

    @Published var buyOrSell: TransactionType = .buy

    @Published var mmkAmount: String = "4580.00"
    @Published var otherAmount: String = "1.00"

    @Published var mmkCurrency = CurrencyModel(
        id: 0, code: "MMK", unit: "1", prices: [])
    @Published var otherCurrency: CurrencyModel?

    private let apiService: APIService

    private var cancellables = Set<AnyCancellable>()

    private var currentDate = Date()

    init(apiService: APIService = APIService()) {
        self.apiService = apiService

        Task {
            await fetchCurrency()
        }

        //        $mmkAmount
        //            .receive(on: DispatchQueue.main)
        //            .sink { _ in
        //                self.mmkAmountChange()
        //            }
        //            .store(in: &cancellables)
        //
        //        $otherAmount
        //            .receive(on: DispatchQueue.main)
        //            .sink { _ in
        //                self.otherAmountChange()
        //            }
        //            .store(in: &cancellables)
    }

    func onChangeBuyOrSell(_ type: TransactionType) {
        self.buyOrSell = type

        var mmk: Double = 0
        var other: Double = 0.0

        if type == .buy {
            mmk = self.otherCurrency!.buyPrice
            other = 1.00
        } else {
            mmk = self.otherCurrency!.sellPrice
            other = 1.00
        }

        self.mmkAmount = formatDouble(mmk)
        self.otherAmount = formatDouble(other)
    }

    func changeOtherCurrency(_ currency: CurrencyModel) {
        self.otherCurrency = currency

        var mmk: Double = 0
        var other: Double = 0.0

        if buyOrSell == .buy {
            mmk = self.otherCurrency!.buyPrice
            other = 1
        } else {
            mmk = self.otherCurrency!.sellPrice
            other = 1
        }

        self.mmkAmount = formatDouble(mmk)
        self.otherAmount = formatDouble(other)

    }

    func mmkAmountChange() {

        var other: Double = 0

        if let value = convertToDouble(mmkAmount) {

            if let rate = otherCurrency?.buyPrice {
                if buyOrSell == .buy {
                    other = value / rate
                } else {
                    other = value / rate
                }

                otherAmount = formatDouble(other)
            }

        }
    }

    func otherAmountChange() {

        var mmk: Double = 0

        if let value = convertToDouble(otherAmount) {

            if let rate = otherCurrency?.buyPrice {

                if buyOrSell == .buy {
                    mmk = rate * value
                } else {
                    mmk = rate * value
                }

                mmkAmount = formatDouble(mmk)
            }

        }
    }

    func convertToDouble(_ value: String) -> Double? {
        if let intValue = Int(value) {
            return Double(intValue)
        } else if let doubleValue = Double(value) {
            return doubleValue
        } else {
            return nil
        }
    }

    @MainActor
    func fetchCurrency() async {

        do {
            //            currencies = try JSONDecoder().decode(
            //                [CurrencyModel].self, from: sampleCurrencyJSON)

            let response: [CurrencyModel] = try await apiService.get(
                type: [CurrencyModel].self,
                endpoint: ApiConstant.getCurrencyList())

            currencies = response
            otherCurrency = response.first
            onChangeBuyOrSell(.buy)

        } catch (let error) {
            print("Error decoding JSON: \(error)")

        }
    }

    @MainActor
    func fetchCurrencyHistory(currencyCode: Int) async {

        do {
            //            let response = try JSONDecoder().decode(
            //                CurrencyHistoryResponse.self, from: sampleCurrencyHistoryJson)

            let response: CurrencyHistoryResponse = try await apiService.get(
                type: CurrencyHistoryResponse.self,
                endpoint: ApiConstant.getCurrencyHistory(
                    currencyCode: currencyCode,
                    date: DateFormatter.currencyHistoryApiDateFormat.string(
                        from: currentDate)))

            currencyHistory = response.data
            recentCurrencyHistory =
                currencyHistory.filter({ item in
                    !item.transactions.isEmpty
                })
                .first

        } catch (let error) {
            print("Error decoding JSON: \(error)")

        }
    }
}
