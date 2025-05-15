//
//  ProfileFavPlayerView.swift
//  PBKSSwiftUI
//
//  Created by Jaideep Singh on 15/05/25.
//

import SwiftUI

struct ProfileFavPlayerView: View {
    @State private var jerseyName: String = "Harpree"
    @State private var jerseyNumber: String = "619"
    @State private var selectedPlayerIndex: Int = 1
    
    let players: [(name: String, image: String)] = [
        ("Arshdeep Singh", "player_demo"),
        ("Shikhar Dhawan", "player_demo"),
        ("Sam Curran", "player_demo"),
        ("Sam Curran", "player_demo"),
        ("Sam Curran", "player_demo")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    // Header
                    ZStack(alignment: .top) {
                        Image("updated_profile_jersey")
                            .resizable()
                            .frame(height: 202)
                        
                        VStack(spacing: 0) {
                            Image("pbsk_logo")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.top, 35)
                        }
                    }
                    .padding(.bottom, 8)
                    
                    // Stepper
                    Image("steps_indicator_2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(10)
                    
                    // Title and Skip
                    HStack {
                        Text("Personalise your experience")
                            .font(.custom(CustomFonts.MontserratBold.rawValue, size: 20))
                            .foregroundColor(CustomColor.getColor(named: .red_ED1C24))
                            .padding(.top, 5)
                        Spacer()
                        Button("Skip") {}
                            .font(.custom(CustomFonts.MontserratMedium.rawValue, size: 14))
                            .foregroundColor(CustomColor.getColor(named: .grey_616161))
                            .underline()
                            .padding(.top, 5)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 8)
                    
                    // Jersey Fields
                    VStack(alignment: .leading, spacing: 12) {
                        TextField("Jersey Name", text: $jerseyName)
                            .font(.custom(CustomFonts.MontserratRegular.rawValue, size: 16))
                            .padding()
                            .background(Color(.systemGray6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                            .cornerRadius(10)
                        
                        TextField("Jersey Number", text: $jerseyNumber)
                            .font(.custom(CustomFonts.MontserratRegular.rawValue, size: 16))
                            .padding()
                            .background(Color(.systemGray6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    
                    // Favorite Player Section
                    VStack(spacing: 16) {
                        Text("Who Is Your favourite Player?")
                            .font(.custom(CustomFonts.MontserratBold.rawValue, size: 18))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        GeometryReader { outerProxy in
                            let width = outerProxy.size.width
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 24) {
                                    ForEach(players.indices, id: \.self) { index in
                                        GeometryReader { geo in
                                            let midX = geo.frame(in: .global).midX
                                            let distance = abs(midX - UIScreen.main.bounds.width / 2)
                                            let scale = max(0.7, 1 - distance / 500)

                                            Image(players[index].image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 90, height: 90)
                                                .clipShape(Circle())
                                                .overlay(
                                                    Circle()
                                                        .stroke(index == selectedPlayerIndex ? Color.orange : Color.brown, lineWidth: 2)
                                                )
                                                .scaleEffect(scale)
                                                .animation(.easeOut(duration: 0.3), value: scale)
                                                .onTapGesture {
                                                    selectedPlayerIndex = index
                                                }
                                        }
                                        .frame(width: 90, height: 90)
                                        
                                    }
                                }
                            }
                            .padding(.horizontal, width - 10)
                        }
                        .frame(height: 100)
                        
                        
                        // Selected Player Name
                        Text(players[selectedPlayerIndex].name)
                            .font(.custom(CustomFonts.MontserratBold.rawValue, size: 18))
                            .foregroundColor(.black)
                        
                        // Subtext
                        Text("Swipe To Select")
                            .font(.custom(CustomFonts.MontserratRegular.rawValue, size: 12))
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    
                    Spacer()
                }
            }
           
            Button {
               
            } label: {
                Text("Submit")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.93, green: 0.11, blue: 0.14).opacity(0.5))
                    .cornerRadius(8)
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            .padding(.bottom, 100)
        }
        .background(Color(.systemGray6).ignoresSafeArea())
    }
}

#Preview {
    ProfileFavPlayerView()
}
