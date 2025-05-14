//
//  HomeVC.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 08/05/25.
//

import SwiftUI

import SwiftUI

struct HomeVC: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    VStack(spacing: 0) {
                        DealOfTheView()
                        ScoreCardLive()
                    }
                    ScoreCardUpcoming()
                    HomeLargeContentView()
                    Shorts()
                    BannerView()
                    ScoreCard()
                    HomeMoreView()
                    SaddaSquad()
                    HomeSmallContentView()
                    FanPoll()
                    HomeMoreView()
                    VerticalPoll()
                }
            
            }
            .navigationTitle("PBKS")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(CustomColor.getColor(named: .red_ED1C24), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("Profile tapped")
                    }) {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(CustomColor.getColor(named: .red_FC2B22))
                            .frame(width: 80, height: 28)
                            
                            .overlay {
                                HStack {
                                    Image("flrpCoins")
                                        
                                    Text("999k")
                                        .font(.custom(CustomFonts.MontserratBold.rawValue, size: 12))
                                }
                            }
                        
                    }
                }
                
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Profile tapped")
                    }) {
                        Image("profileImg")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}


#Preview {
    HomeVC()
}
