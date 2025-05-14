//
//  ScoreCardLive.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 13/05/25.
//

import SwiftUI

struct ScoreCardLive: View {
    var body: some View {
        ScoreCardLiveView()
    }
}

struct ScoreCardLiveView : View {
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
                
                VStack(spacing: 10) {
                    Image("liveIcon")
                    
                    HStack {
                        VStack(spacing: 15) {
                            HStack(alignment: .top, spacing: 8) {
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

                                VStack(alignment: .leading, spacing: 4) {
                                    //MARK: Yet to bat
//                                    Text("Yet to bat")
//                                        .font(.custom(CustomFonts.MontserratBold.name, size: 20))
//                                        .padding(.top, 15)
                                    
                                    //MARK: Match live
//                                    Text("204/7")
//                                        .font(.custom(CustomFonts.MontserratBold.name, size: 20))
//                                       .padding(.top, 15)
//                                    Text("(18.0)")
//                                        .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
                                    
                                    //MARK: Single Super Over
//                                    Text("204/7")
//                                        .font(.custom(CustomFonts.MontserratBold.name, size: 20))
//                                    
//                                    Text("(18.0)")
//                                        .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
//                                    
//                                    Divider()
//                                        .frame(width: 92, height: 1)
//                                        .background(CustomColor.getColor(named: .grey_light_BDBDBD))
//                                    
//                                    HStack(spacing: 3) {
//                                        Text("7/1")
//                                            .font(.custom(CustomFonts.MontserratBold.name, size: 12))
//                                        Text("(10.4)")
//                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 10))
//                                    }
                                    
                                    //MARK: Two Super Over
                                    
                                    HStack(spacing: 3) {
                                        Text("204/7")
                                            .font(.custom(CustomFonts.MontserratBold.name, size: 20))
                                        
                                        Text("(18.0)")
                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
                                        
                                    }
                                    
                                    Divider()
                                        .frame(width: 92, height: 1)
                                        .background(CustomColor.getColor(named: .grey_light_BDBDBD))
                                    
                                    HStack(spacing: 3) {
                                        Text("7/1")
                                            .font(.custom(CustomFonts.MontserratBold.name, size: 12))
                                        Text("(10.4)")
                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 10))
                                    }
                                    
                                    Divider()
                                        .frame(width: 92, height: 1)
                                        .background(CustomColor.getColor(named: .grey_light_BDBDBD))
                                    
                                    HStack(spacing: 3) {
                                        Text("7/1")
                                            .font(.custom(CustomFonts.MontserratBold.name, size: 12))
                                        Text("(10.4)")
                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 10))
                                    }
                                    
                                }
                            }

                            
                        }

                        Spacer()

                        VStack(spacing: 15) {
                            HStack(alignment: .top, spacing: 8) {
                                VStack(alignment: .trailing, spacing: 4) {
                                    //MARK: Yet to bat
//                                    Text("Yet to bat")
//                                        .font(.custom(CustomFonts.MontserratBold.name, size: 20))
//                                        .padding(.top, 15)
                                    
                                    
                                    //MARK: Match live
//                                    Text("204/7")
//                                        .font(.custom(CustomFonts.MontserratBold.name, size: 20))
//                                       .padding(.top, 15)
//                                    Text("(18.0)")
//                                        .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
                                    
                                    //MARK: Single Super Over
                                    
//                                    Text("204/7")
//                                        .font(.custom(CustomFonts.MontserratBold.name, size: 20))
//                                    
//                                    Text("(18.0)")
//                                        .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
//                                    
//                                    Divider()
//                                        .frame(width: 92, height: 1)
//                                        .background(CustomColor.getColor(named: .grey_light_BDBDBD))
//                                    
//                                    HStack(spacing: 3) {
//                                        Text("7/1")
//                                            .font(.custom(CustomFonts.MontserratBold.name, size: 12))
//                                        Text("(10.4)")
//                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 10))
//                                    }
                                    
                                    //MARK: Two Super Over
                                    
                                    HStack(spacing: 3) {
                                        Text("204/7")
                                            .font(.custom(CustomFonts.MontserratBold.name, size: 20))
                                        
                                        Text("(18.0)")
                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
                                        
                                    }
                                    
                                    Divider()
                                        .frame(width: 92, height: 1)
                                        .background(CustomColor.getColor(named: .grey_light_BDBDBD))
                                    
                                    HStack(spacing: 3) {
                                        Text("7/1")
                                            .font(.custom(CustomFonts.MontserratBold.name, size: 12))
                                        Text("(10.4)")
                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 10))
                                    }
                                    
                                    Divider()
                                        .frame(width: 92, height: 1)
                                        .background(CustomColor.getColor(named: .grey_light_BDBDBD))
                                    
                                    HStack(spacing: 3) {
                                        Text("7/1")
                                            .font(.custom(CustomFonts.MontserratBold.name, size: 12))
                                        Text("(10.4)")
                                            .font(.custom(CustomFonts.MontserratRegular.name, size: 10))
                                    }
                                    
                                }
                                
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

                                    Text("DC")
                                        .font(.custom(CustomFonts.MontserratBold.name, size: 18))
                                }
                                .alignmentGuide(.top) { _ in 0 }

                            }
                        }
                    }
                }
                
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
                            
                            Button {
                                print("Match centre clicked")
                            } label: {
                                Text("Match Centre")
                                    .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                            }
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
    ScoreCardLive()
}
