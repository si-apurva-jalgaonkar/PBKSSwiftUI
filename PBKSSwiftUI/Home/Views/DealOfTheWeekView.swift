//
//  DealOfTheWeekView.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 13/05/25.
//

import SwiftUI

struct DealOfTheWeekView: View {
    var body: some View {
        DealOfTheView()
    }
}

struct DealOfTheView : View {
    var body: some View {
        
        HStack {
            
            Image("bagIcon")
            
            Text("Deal of the week")
                .font(.custom(CustomFonts.MontserratMedium.name, size: 14))
            
            Spacer()
            
            HStack(spacing: 0) {
                Button {
                    print("Button clicked")
                } label: {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 107,height: 25)
                        .padding()
                        .foregroundColor(CustomColor.getColor(named: .red_ED1C24))
                        .overlay {
                            Text("SHOP NOW")
                                .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                                .font(.custom(CustomFonts.MontserratBold.name, size: 12))
                        }
                }
                
                Button {
                    print("Cancel Btn clicked")
                } label: {
                    Image("closeBtnBox")
                }
            }
        }
        .frame(height: 25)
        .padding()
        .background(CustomColor.getColor(named: .yellow_FFDEAD))
    }
}

#Preview {
    DealOfTheWeekView()
}
