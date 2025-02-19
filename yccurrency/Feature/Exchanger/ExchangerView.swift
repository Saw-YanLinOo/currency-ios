//
//  BottomNavBarView.swift
//  yccurrency
//
//  Created by mac on 5/2/25.
//

import SwiftUI

struct ExchangerView: View {

    @StateObject private var viewModel: ExchangerViewModel = .init()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Money Exchangers")
                .font(.largeTitle)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)

            ScrollView {
                VStack {
                    ForEach(viewModel.exchangerList, id: \.id) { item in
                        ExchnagerProfileView(exchanger: item)
                    }
                }
            }.scrollIndicators(.hidden)
        }
        .background(Color.gray.opacity(0.1))

    }

    struct ExchnagerProfileView: View {
        var exchanger: MoneyExchangerModel

        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Image(.profile)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .padding()

                    VStack(alignment: .leading) {
                        Text("\(exchanger.name)")
                            .font(.system(size: 18, weight: .bold))
                            .padding(.bottom, 2)
                        Text("\(exchanger.role)")
                            .font(.system(size: 18, weight: .regular))
                    }

                    Spacer()

                    Image(systemName: "chevron.right")

                }.padding(.bottom, 16)

                Text("Contact")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom, 2)

                VStack(alignment: .leading) {
                    ForEach(exchanger.contacts, id: \.number) { item in
                        Text("(\(item.number) \(item.countryCode))")
                            .font(.system(size: 16, weight: .thin))
                            .padding(.bottom, 2)
                    }

                }
                .padding(.horizontal)
                .padding()

                //                Text("About")
                //                    .font(.system(size: 18, weight: .bold))
                //                    .padding(.bottom, 2)
                //
                //                Text(
                //                    "Naing Ultra is a leading currency exchange provider that has been professionally operating for over 50 years. Since our establishment, we have been striving to comprehensively improve our business to provide our customers with an exceptional experience."
                //                )
                //                .font(.system(size: 16, weight: .thin))
                //                .lineLimit(3)
                //                .padding(.bottom)

                Text("Rate")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom, 2)

                VStack {
                    ForEach(exchanger.rates, id: \.amount) { item in
                        HStack(alignment: .top) {
                            Text(
                                "\(item.fromCurrency == "MMK" ? "100,000" : "\(item.amount)") \(item.fromCurrency)"
                            )
                            .font(.system(size: 16, weight: .thin))
                            .frame(width: 120)

                            Image(systemName: "arrow.right")
                                .padding(.horizontal, 24)

                            Text(
                                "\(item.fromCurrency == "MMK" ? "100,000" : "\(item.amount)") \(item.toCurrency)"
                            )
                            .font(.system(size: 16, weight: .thin))
                            .lineLimit(3)
                            .padding(.bottom)
                        }
                    }
                }

                //                HStack(alignment: .top) {
                //                    Text("768 THB")
                //                        .font(.system(size: 16, weight: .thin))
                //                        .frame(width: 120)
                //
                //                    Image(systemName: "arrow.right")
                //                        .padding(.horizontal, 24)
                //
                //                    Text("100,000 MMK")
                //                        .font(.system(size: 16, weight: .thin))
                //                        .lineLimit(3)
                //                        .padding(.bottom)
                //                }

                HStack {
                    ForEach(
                        exchanger.paymentType, id: \.hashValue,
                        content: { icon in
                            Image(icon)
                                .resizable()
                                .frame(width: 32, height: 32)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        })
                }
                .padding(.bottom, 24)
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
        }
    }
}

#Preview {
    ExchangerView()
}
