//
//  ScoreCard.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 08/05/25.
//

import SwiftUI

struct ScoreCard: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("2024 Fixtures")
                .foregroundStyle(CustomColor.getColor(named: .black_212121))
                .font(.custom(CustomFonts.MontserratBold.name, size: 18))
                .padding(.horizontal)
            
            Image("homeSeperator")
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 20){
                    CardView()
                    CardView()
                    CardView()
                }
                .padding()
            }
            
        }
        
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading){
                    Text("Match 3")
                    Text("Apr 25, 2025 15:30")
                }
                .foregroundStyle(CustomColor.getColor(named: .black_212121))
                .font(.custom(CustomFonts.MontserratRegular.name, size: 10))
                Spacer()
                Image("liveIcon")
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(CustomColor.getColor(named: .grey_light_BDBDBD))
            
            HStack {
                Rectangle()
                    .frame(width: 30, height: 30)
                    .cornerRadius(2)
                    .foregroundStyle(CustomColor.getColor(named: .grey_light_BDBDBD).opacity(0.5))
                    .overlay {
                        Image("teamIcon")
                    }
                
                Text("PBKS")
                    .foregroundStyle(CustomColor.getColor(named: .black_212121))
                    .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                Spacer()
                Text("18/5")
                    .foregroundStyle(CustomColor.getColor(named: .black_212121))
                    .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                Text("(18.1)")
                    .foregroundStyle(CustomColor.getColor(named: .black_212121))
                    .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
            }
            
            HStack {
                Rectangle()
                    .frame(width: 30, height: 30)
                    .cornerRadius(2)
                    .foregroundStyle(CustomColor.getColor(named: .grey_light_BDBDBD).opacity(0.5))
                    .overlay {
                        Image("teamIcon")
                    }
                
                Text("PBKS")
                    .foregroundStyle(CustomColor.getColor(named: .black_212121))
                    .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                Spacer()
                Text("18/5")
                    .foregroundStyle(CustomColor.getColor(named: .black_212121))
                    .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                Text("(18.1)")
                    .foregroundStyle(CustomColor.getColor(named: .black_212121))
                    .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
            }
            
            Text("Himachal Pradesh Cricket Association Stadium, Dharamsala")
                .lineLimit(2)
                .foregroundStyle(CustomColor.getColor(named: .black_212121))
                .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
                .multilineTextAlignment(.center)
                .padding(5)
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(CustomColor.getColor(named: .grey_light_BDBDBD))
            
            HStack {
                Text("PBKS needs 30 runs from 11 balls to win")
                    .foregroundStyle(CustomColor.getColor(named: .black_212121))
                    .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
                Spacer()
                Image("rightArrow")
            }
            
        }
        .padding()
        .background(CustomColor.getColor(named: .white_FFFFFF))
        .cornerRadius(5)
        .frame(width: 300)
        .shadow(color: .black, radius: 2)
        
        
    }
}

#Preview {
    ScoreCard()
}
