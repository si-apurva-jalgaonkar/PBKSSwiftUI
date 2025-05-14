//
//  ScoreCardUpcoming.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 13/05/25.
//

import SwiftUI

struct ScoreCardUpcoming: View {
    var body: some View {
        ScoreCardUpcomingView()
    }
}

struct ScoreCardUpcomingView : View {
    var body: some View {
        
        ZStack {
            Image("scoreCardBg")
                .resizable()
                .frame(height: 450)
            
            VStack {
                
                VStack(alignment:.leading, spacing: 10) {
                    
                    Text("Good Evening, Harpreet It’s match day!")
                        .multilineTextAlignment(.leading)
                        .font(.custom(CustomFonts.MontserratBold.name, size: 20))
                    
                    Text("Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur, Mohali")
                        .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                    
                    Divider()
                        .frame(height: 1)
                        .background(CustomColor.getColor(named: .grey_light_BDBDBD))
                }
                
                VStack {
                    
                    HStack {
                        
                        VStack(spacing: 15) {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 60, height: 60)
                                .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF).opacity(0.3))
                                .overlay {
                                    Image("teamIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(5)
                                }
                            
                            Text("PBKS")
                                .font(.custom(CustomFonts.MontserratBold.name, size: 18))
                        }
                        .alignmentGuide(.top) { _ in 0 }
                        
                        Spacer()
                        
                        VStack {
                            HStack {

                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 20, height: 20)
                                    .overlay {
                                        Text("1")
                                            .foregroundStyle(CustomColor.getColor(named: .black_212121))
                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 16))
                                    }
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 20, height: 20)
                                    .overlay {
                                        Text("0")
                                            .foregroundStyle(CustomColor.getColor(named: .black_212121))
                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 16))
                                    }
                            }
                            Text("Hours")
                                .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                            
                        }
                        
                        VStack {
                            HStack {
                                
                                VStack(spacing: 5) {
                                    RoundedRectangle(cornerRadius: 1)
                                        .frame(width: 3.5, height: 3.5)
                                    
                                    RoundedRectangle(cornerRadius: 1)
                                        .frame(width: 3.5, height: 3.5)
                                }
                                .foregroundStyle(CustomColor.getColor(named: .pink_F59494))
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 20, height: 20)
                                    .overlay {
                                        Text("1")
                                            .foregroundStyle(CustomColor.getColor(named: .black_212121))
                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 16))
                                    }
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 20, height: 20)
                                    .overlay {
                                        Text("0")
                                            .foregroundStyle(CustomColor.getColor(named: .black_212121))
                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 16))
                                    }
                            }
                            Text("Minutes")
                                .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                            
                        }
                        
                        VStack {
                            HStack {
                                
                                VStack(spacing: 5) {
                                    RoundedRectangle(cornerRadius: 1)
                                        .frame(width: 3.5, height: 3.5)
                                    
                                    RoundedRectangle(cornerRadius: 1)
                                        .frame(width: 3.5, height: 3.5)
                                }
                                .foregroundStyle(CustomColor.getColor(named: .pink_F59494))
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 20, height: 20)
                                    .overlay {
                                        Text("1")
                                            .foregroundStyle(CustomColor.getColor(named: .black_212121))
                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 16))
                                    }
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 20, height: 20)
                                    .overlay {
                                        Text("0")
                                            .foregroundStyle(CustomColor.getColor(named: .black_212121))
                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 16))
                                    }
                            }
                            Text("Seconds")
                                .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                            
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 15) {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 60, height: 60)
                                .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF).opacity(0.3))
                                .overlay {
                                    Image("teamIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(5)
                                }
                            
                            Text("PBKS")
                                .font(.custom(CustomFonts.MontserratBold.name, size: 18))
                        }
                        .alignmentGuide(.top) { _ in 0 }
                        
                    }
                    
                }
                .padding(.top, 10)
                
                Spacer()
                
                VStack(spacing: 10) {
                    
                    Divider()
                        .frame(height: 1)
                        .background(CustomColor.getColor(named: .grey_light_BDBDBD))
                    
                    Text("The match is tied (PBKS needs 3 runs from 3 balls to win the super over).")
                        .font(.custom(CustomFonts.MontserratMedium.name, size: 14))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 20)
                    
                    
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(CustomColor.getColor(named: .white_FFFFFF), lineWidth: 1)
                        .frame(width: 150, height: 28)
                        .foregroundStyle(.clear)
                        .overlay {
                            Text("Match Centre")
                                .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                        }
                        .padding(.bottom, 58)
                    
                }
            }
            .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
            .padding()
        }
        .frame(height: 450)
        
    }
}

#Preview {
    ScoreCardUpcoming()
}
