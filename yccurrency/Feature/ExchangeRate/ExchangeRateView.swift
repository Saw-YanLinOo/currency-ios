//
//  BottomNavBarView.swift
//  yccurrency
//
//  Created by mac on 5/2/25.
//

import SwiftUI

enum ActiveField {
    case mmkAmount, otherAmount, none
}

struct ExchangeRateView: View {

    @State private var currentDate = Date()

    @StateObject private var viewModel: ExchangeRateViewModel = .init()

    @FocusState private var focusedField: ActiveField?

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
                                    viewModel.onChangeBuyOrSell(.buy)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .foregroundColor(
                                    viewModel.buyOrSell == .buy
                                        ? .white : .gray
                                )
                                .background(
                                    viewModel.buyOrSell == .buy ? .blue : .white
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 8))

                                Button("Sell") {
                                    viewModel.onChangeBuyOrSell(.sell)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .foregroundColor(
                                    viewModel.buyOrSell == .sell
                                        ? .white : .gray

                                )
                                .background(
                                    viewModel.buyOrSell == .sell
                                        ? .blue : .white
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 8))

                            }
                            .padding(4)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .padding(.horizontal)
                    }

                    CurrencyInputRowForMMK(
                        amount: $viewModel.mmkAmount,
                        currency: $viewModel.mmkCurrency,
                        onAmountChange: { newValue in
                            viewModel.mmkAmountChange()
                        },
                        focusedField: $focusedField,
                        field: .mmkAmount
                    )

                    Text("=")
                        .font(.system(size: 36, weight: .medium))
                        .foregroundStyle(.white)
                        .padding(.horizontal)

                    CurrencyInputRowForOther(
                        amount: $viewModel.otherAmount,
                        currency: viewModel.otherCurrency,
                        currencies: viewModel.currencies,
                        onSelection: { currency in
                            viewModel.changeOtherCurrency(currency)
                        },
                        onAmountChange: { newValue in
                            viewModel.otherAmountChange()
                        },
                        focusedField: $focusedField,
                        field: .otherAmount
                    )

                    ExchangeRateInfoView(
                        info:
                            "\(viewModel.otherCurrency?.flag ?? " ") \(viewModel.otherAmount) \(viewModel.otherCurrency?.code ?? " ")   =   \(viewModel.mmkCurrency.flag) \(viewModel.mmkAmount) \(viewModel.mmkCurrency.code)",
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

struct CurrencyInputRowForMMK: View {

    @Binding var amount: String
    @Binding var currency: CurrencyModel
    var onAmountChange: (String) -> Void
    @FocusState.Binding var focusedField: ActiveField?
    let field: ActiveField

    var body: some View {
        HStack {

            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.black)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                //                .disabled(true)
                .focused($focusedField, equals: field)
                .onChange(of: amount) { _, newValue in
                    if focusedField == field {
                        onAmountChange(newValue)
                    }
                }

            Button(action: {}) {
                HStack {
                    Text("\(currency.flag)  \(currency.code)")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 20, weight: .medium))
                }
            }
            .frame(width: 90)
            .padding(.horizontal, 12)
            .padding(.vertical, 20)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))

        }
        .padding(.horizontal)
    }
}

struct CurrencyInputRowForOther: View {

    @Binding var amount: String
    var currency: CurrencyModel?
    var currencies: [CurrencyModel]
    var onSelection: (CurrencyModel) -> Void
    var onAmountChange: (String) -> Void
    @FocusState.Binding var focusedField: ActiveField?
    let field: ActiveField

    var body: some View {
        HStack {

            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.black)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .focused($focusedField, equals: field)
                .onChange(of: amount) { _, newValue in
                    if focusedField == field {
                        onAmountChange(newValue)
                    }
                }

            Menu {
                ForEach(currencies, id: \.id) { type in
                    Button(action: {
                        onSelection(type)
                    }) {
                        Text("\(type.flag)  \(type.code)")
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                            .font(.system(size: 24, weight: .medium))

                    }
                }
            } label: {
                HStack {
                    Text("\(currency?.flag ?? "")  \(currency?.code ?? "")")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 18, weight: .medium))

                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 16, height: 10)
                        .foregroundStyle(.black.opacity(0.7))

                }

            }
            .frame(width: 100)
            .padding(.horizontal, 8)
            .padding(.vertical, 20)
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
                .frame(maxWidth: .infinity, alignment: .leading)

            VStack(spacing: 12) {
                ForEach(currencies) { currency in
                    NavigationLink(
                        destination: ExchangeRateDetailView(
                            id: currency.id, code: currency.code,
                            flag: currency.flag),
                        label: {
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

                    Text(currency.buyPrice.formattedWithSeparator())
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

                    Text(currency.sellPrice.formattedWithSeparator())
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
