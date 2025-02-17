//
//  BottomNavBarView.swift
//  yccurrency
//
//  Created by mac on 5/2/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ProfileItemView(title: "Name", value: "YanYan Chan")
            ProfileItemView(title: "Email", value: "yc@gmail.com")

            Spacer()

            Text("Teams & Conditions")
                .font(.system(size: 14, weight: .thin))
                .underline()
                .padding(.bottom, 12)

            Text("Logout")
                .padding()
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, minHeight: 46)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding(.bottom, 12)

                .padding(.bottom, 40)

        }
        .padding()
    }
}

struct ProfileItemView: View {

    var title: String
    var value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            Text(value)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 46, alignment: .leading)

                .background(
                    RoundedRectangle(cornerRadius: 12).stroke(
                        Color.gray, lineWidth: 1)
                )
        }
        .padding(.vertical)
    }
}

#Preview {
    ProfileView()
}
