//
//  BottomNavBarView.swift
//  yccurrency
//
//  Created by mac on 5/2/25.
//

import SwiftUI

struct ExchangerView: View {

    @State var searchText: String = ""
    var paymentType: [ImageResource] = [
        .krungthaiBankIcon,
        .bangkokBankIcon,
        .kplusIcon,
        .scbPay,
        .cbPay,
        .ayaPayIcon,
        .kpayIcon,
        .waveIcon,

    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Money Exchangers")
                .font(.largeTitle)
                .padding(.horizontal)

            ScrollView {
                VStack {
                    ForEach([1, 2, 3, 4, 5], id: \.self) { item in
                        ExchnagerProfileView(paymentType: paymentType)
                    }

                }
            }.scrollIndicators(.hidden)

            //            .searchable(text: $searchText)

        }
        .background(Color.gray.opacity(0.1))

    }

    struct ExchnagerProfileView: View {
        var paymentType: [ImageResource]

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
                        Text("Naing Ultra")
                            .font(.system(size: 18, weight: .bold))
                            .padding(.bottom, 2)
                        Text("Money Exchanger")
                            .font(.system(size: 18, weight: .regular))
                    }

                    Spacer()

                    Image(systemName: "chevron.right")

                }.padding(.bottom, 16)

                Text("Contact")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom, 2)
                VStack(alignment: .leading) {
                    Text("(+66 81 234 5678) TH")
                        .font(.system(size: 16, weight: .thin))
                        .padding(.bottom, 2)
                    Text("(+95 81 234 5678) MM")
                        .font(.system(size: 16, weight: .thin))
                        .padding(.bottom, 2)
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

                HStack(alignment: .top) {
                    Text("100,000 MMK")
                        .font(.system(size: 16, weight: .thin))
                        .frame(width: 120)

                    Image(systemName: "arrow.right")
                        .padding(.horizontal, 24)

                    Text("757 THB")
                        .font(.system(size: 16, weight: .thin))
                        .lineLimit(3)
                        .padding(.bottom)
                }
                HStack(alignment: .top) {
                    Text("768 THB")
                        .font(.system(size: 16, weight: .thin))
                        .frame(width: 120)

                    Image(systemName: "arrow.right")
                        .padding(.horizontal, 24)

                    Text("100,000 MMK")
                        .font(.system(size: 16, weight: .thin))
                        .lineLimit(3)
                        .padding(.bottom)
                }

                HStack {
                    ForEach(
                        paymentType, id: \.hashValue,
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
