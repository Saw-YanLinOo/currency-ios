//
//  BottomNavBarView.swift
//  yccurrency
//
//  Created by mac on 5/2/25.
//

import SwiftUI

struct ExchangeRateView: View {

    @State private var fromAmount = "4580"
    @State private var toAmount = "1"
    @State private var selectedFromCurrencyCode = "MMK"
    @State private var selectedToCurrency = "USD"
    @State private var selectedFromCurrencyFlag = "🇲🇲"
    @State private var selectedToCurrencyFlag = "🇺🇸"

    @State private var currentDate = Date()

    @StateObject private var viewModel: ExchangeRateViewModel = .init()

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Color.clear.frame(height: geometry.safeAreaInsets.top)

                    VStack(alignment: .leading) {
                        Text(
                            DateFormatter.shortFormat.string(from: currentDate)
                        )
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        HStack {
                            Text("Welcome")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Spacer()
                            HStack {

                                Button("Buy") {
                                    // do something
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .foregroundColor(.gray)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))

                                Button("Sell") {
                                    // do something
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .foregroundColor(.white)
                                .background(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 8))

                            }
                            .padding(4)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .padding(.horizontal)
                    }

                    CurrencyInputRow(
                        amount: $fromAmount,
                        currency: $selectedFromCurrencyCode,
                        flag: $selectedFromCurrencyFlag)

                    Text("=")
                        .font(.system(size: 36, weight: .medium))
                        .foregroundStyle(.white)
                        .padding(.horizontal)

                    CurrencyInputRow(
                        amount: $toAmount, currency: $selectedToCurrency,
                        flag: $selectedToCurrencyFlag)
                    ExchangeRateInfoView(
                        info:
                            "\(selectedToCurrencyFlag) \(toAmount) \(selectedToCurrency)   =   \(selectedFromCurrencyFlag) \(fromAmount) \(selectedFromCurrencyCode)",
                        date:
                            "As of \(DateFormatter.longFormat.string(from: currentDate))"
                    )
                }
                .background(Color.blue)
                LatestRateView(currencies: viewModel.currencies)
            }
            .scrollIndicators(.hidden)
            .background(Color.gray.opacity(0.1))
            .edgesIgnoringSafeArea(.top)
        }
        .onAppear {
            Task {
                await viewModel.fetchCurrency()
            }
        }

    }

}

struct ExchangeRateInfoView: View {

    var info: String
    var date: String

    var body: some View {
        VStack(spacing: 12) {
            Text("\(info)")
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .bold))
                .kerning(1)

            Text("\(date)")
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .regular))
                .kerning(1)

        }
        .padding(.vertical, 32)
    }
}

struct CurrencyInputRow: View {

    @Binding var amount: String
    @Binding var currency: String
    @Binding var flag: String

    var body: some View {
        HStack {

            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.black)
                .padding()
                .background(Color.white)
                .cornerRadius(8)

            Button("\(flag)  \(currency)", action: {})
                .foregroundStyle(.black)
                .fontWeight(.bold)
                .font(.system(size: 24, weight: .medium))
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))

        }
        .padding(.horizontal)
    }
}

struct LatestRateView: View {

    var currencies: [CurrencyModel]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Latest Rate")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)

            VStack(spacing: 12) {
                ForEach(currencies) { currency in
                    NavigationLink(destination: ExchangeRateDetailView(id: currency.id, code: currency.code, flag: currency.flag), label: {
                        LatestRateCardView(currency: currency)
                    })
                }
            }
            .padding(.bottom, 24)
        }
    }
}

struct LatestRateCardView: View {

    var currency: CurrencyModel

    var body: some View {
        VStack {

            HStack {
                Text("\(currency.flag) \(currency.code)")
                    .frame(maxWidth: 120, alignment: .leading)
                    .font(.system(size: 20, weight: .thin))
                    .foregroundStyle(.black)

                VStack {
                    HStack {
                        Text("Buy(MMK)")
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .light))

                        Image(systemName: "\(currency.buySignIcon)")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(currency.buySignColor)

                    }
                    .padding(.bottom, 2)

                    Text(String(format: "%.2f", currency.buyPrice))
                        .font(.system(size: 16, weight: .regular))

                }

                Spacer(minLength: 12)

                VStack {
                    HStack {
                        Text("Sell(MMK)")
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .light))
                        Image(systemName: "\(currency.sellSignIcon)")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(currency.sellSignColor)

                    }
                    .padding(.bottom, 2)

                    Text(String(format: "%.2f", currency.sellPrice))
                        .font(.system(size: 16, weight: .regular))

                }

                Spacer(minLength: 12)

                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }
}

#Preview {
    ExchangeRateView()
}
