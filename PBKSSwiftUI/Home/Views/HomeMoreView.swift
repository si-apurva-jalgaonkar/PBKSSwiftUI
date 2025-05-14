//
//  HomeMoreView.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 08/05/25.
//

import SwiftUI

struct HomeMoreView: View {
    var body: some View {
        VStack {
            ZStack {
                Divider()
                    .frame(height: 1)
                    .background(CustomColor.getColor(named: .grey_light_BDBDBD))
                    .padding()
                
                Rectangle()
                    .frame(width: 86,height: 24)
                    .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                    .cornerRadius(5)
                    .overlay {
                        Button {
                            print("More btn clicked")
                        } label: {
                            Text("More")
                                .foregroundStyle(CustomColor.getColor(named: .red_ED1C24))
                                .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                        }
                    }
            }
        }
    }
}

#Preview {
    HomeMoreView()
}
