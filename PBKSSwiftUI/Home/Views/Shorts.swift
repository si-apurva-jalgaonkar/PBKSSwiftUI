//
//  Shorts.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 08/05/25.
//

import SwiftUI

struct Shorts: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Kings' Cuts: Your Curated Shorts")
                .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                .font(.headline)
            
            Image("shortsSeperator")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10){
                    ForEach(0..<5) {index in
                        ShortsViewItem()
                    }
                }
            }
        }
        .padding()
        .background(CustomColor.getColor(named: .red_ED1C24))
    }
}

struct ShortsViewItem: View {
    var body: some View {
        VStack {
            Image("shortsImg")
                .resizable()
                .frame(width: 90, height: 90)
                .cornerRadius(5)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(CustomColor.getColor(named: .pink_F59494))
                )
            
            Text("Punjab Kings can qualify for TATA IPL 2023 playoffs")
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
        }
        .frame(width: 90, height: 170)
        .padding(.leading, 10)
    }
}

#Preview {
    Shorts()
}
