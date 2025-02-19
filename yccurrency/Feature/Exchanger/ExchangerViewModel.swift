//
//  ExchangerViewModel.swift
//  yccurrency
//
//  Created by mac on 19/2/25.
//
import Foundation

class ExchangerViewModel: ObservableObject {

    @Published var exchangerList: [MoneyExchangerModel] = []

    private let apiService: APIService

    init(apiService: APIService = APIService()) {
        self.apiService = apiService

        Task {
            await fetchMoneyExchanger()
        }
    }

    @MainActor
    func fetchMoneyExchanger() async {

        do {
            let response = try JSONDecoder().decode(
                [MoneyExchangerModel].self, from: sampleMoneyExchangerJson)

            exchangerList = response

        } catch (let error) {
            print("Error decoding JSON: \(error)")

        }
    }
}
