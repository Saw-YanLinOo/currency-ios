//
//  ApiConstant.swift
//  yccurrency
//
//  Created by mac on 16/2/25.
//

struct ApiConstant {
    static let baseURL = "https://findmmp.link"
    static let apiToken =
        "Bearer 707758|HFdwfgjw49UiLRwMfc2pMbriPGRrqRPLmmcasnNQ595d6091"

    static func getCurrencyList() -> String {
        return "/api/v2/currency/getLatest"
    }

    static func getCurrencyHistory(
        currencyCode: Int, date: String, count: Int = 30
    ) -> String {
        return
            "/api/v2/currency/getTransactions?which=\(currencyCode)&date=\(date)&count=\(count)"
    }
}
