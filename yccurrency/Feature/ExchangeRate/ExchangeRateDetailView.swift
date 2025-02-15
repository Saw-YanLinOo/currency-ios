//
//  BottomNavBarView.swift
//  yccurrency
//
//  Created by mac on 5/2/25.
//

import SwiftUI

struct ExchangeRateDetailView: View {

    var id: Int
    var code: String
    var flag: String

    @StateObject private var viewModel: ExchangeRateViewModel = .init()

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ResentRateView(
                    recentCurrency: viewModel.recentCurrencyHistory, code: code)

                HStack {
                    Text("All Detail")
                        .font(.system(size: 14, weight: .medium))
                        .padding(.trailing, 4)
                    Image(systemName: "chevron.up.chevron.down")
                        .resizable()
                        .frame(width: 8, height: 16)
                }
                .padding()
                .padding(.horizontal, 16)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding(.horizontal)
                .frame(maxWidth: geometry.size.width, alignment: .trailing)
                .padding(.bottom, 12)

                VStack(spacing: 12) {
                    ForEach(viewModel.currencyHistory) { item in
                        HistoryRateCardView(currencyHistory: item, flag: flag)
                    }
                }
            }
            .background(Color.gray.opacity(0.1))
        }
        .onAppear {
            Task {
                await viewModel.fetchCurrencyHistory()
            }
        }

    }

}

struct ResentRateView: View {

    var recentCurrency: CurrencyHistoryModel?
    var code: String
    var body: some View {
        VStack {
            Text("Recent \(code) Rate")
                .font(.system(size: 16, weight: .bold))
                .padding(.bottom, 16)
            HStack {
                VStack {
                    HStack {
                        Text("Buy(MMK)")
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .light))

                        Image(
                            systemName:
                                "\(recentCurrency?.transactions.first?.buySignIcon ?? "minus.circle.fill")"
                        )
                        .resizable()
                        .frame(width: 14, height: 14)
                        .foregroundColor(
                            recentCurrency?.transactions.first?.buySignColor)

                    }
                    .padding(.bottom, 2)

                    Text(
                        String(
                            format: "%.2f",
                            recentCurrency?.transactions.first?.buyPrice ?? 0.00
                        )
                    )
                    .font(.system(size: 24, weight: .regular))

                }

                Spacer()

                VStack {
                    HStack {
                        Text("Sell(MMK)")
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .light))

                        Image(
                            systemName:
                                "\(recentCurrency?.transactions.first?.sellSignIcon ?? "minus.circle.fill")"
                        )
                        .resizable()
                        .frame(width: 14, height: 14)
                        .foregroundColor(
                            recentCurrency?.transactions.first?.sellSignColor)

                    }
                    .padding(.bottom, 2)

                    Text(
                        String(
                            format: "%.2f",
                            recentCurrency?.transactions.first?.sellPrice
                                ?? 0.00
                        )
                    )
                    .font(.system(size: 24, weight: .regular))

                }
            }
            .padding(.horizontal, 32)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}

struct HistoryRateCardView: View {
    var currencyHistory: CurrencyHistoryModel
    var flag: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(flag)")
                    .font(.system(size: 32))
                    .padding(.trailing, 8)

                Text("\(currencyHistory.formattedDate)")
                    .font(.system(size: 24, weight: .semibold))
            }
            VStack {

                if currencyHistory.transactions.isEmpty {
                    Text("No data")
                        .font(.system(size: 20, weight: .thin))
                        .frame(maxWidth: .infinity)
                        .padding()
                } else {
                    ForEach(currencyHistory.transactions) { transaction in
                        TransactionRateCardView(transaction: transaction)
                    }
                }

            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)

    }
}

struct TransactionRateCardView: View {

    var transaction: Transaction

    var body: some View {
        VStack {

            HStack {
                Text("\(transaction.time)")
                    .frame(maxWidth: 120, alignment: .leading)
                    .font(.system(size: 20, weight: .thin))
                    .foregroundStyle(.black)

                VStack {
                    HStack {
                        Text("Buy(MMK)")
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .light))

                        Image(systemName: "\(transaction.buySignIcon)")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(transaction.buySignColor)

                    }
                    .padding(.bottom, 2)

                    Text(String(format: "%.2f", transaction.buyPrice))
                        .font(.system(size: 16, weight: .regular))

                }

                Spacer(minLength: 12)

                VStack {
                    HStack {
                        Text("Sell(MMK)")
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .light))
                        Image(systemName: "\(transaction.sellSignIcon)")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(transaction.sellSignColor)

                    }
                    .padding(.bottom, 2)

                    Text(String(format: "%.2f", transaction.sellPrice))
                        .font(.system(size: 16, weight: .regular))

                }
            }
        }
        .padding()
    }
}
#Preview {
    ExchangeRateDetailView(
        id: 1, code: "USD", flag: "🇺🇸"
    )
}
