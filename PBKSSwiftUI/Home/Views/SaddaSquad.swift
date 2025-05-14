//
//  SaddaSquad.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 12/05/25.
//

import SwiftUI

struct SaddaSquad: View {
    @State private var selectedIndex = 0
    let players = [
        PlayerData(firstName: "Shikhar", lastName: "Dhawan", role: "Batter", country: "India", matches: 217, runs: 6617, imageName: "squadPlayerImg"),
        PlayerData(firstName: "Virat", lastName: "Kohli", role: "Batter", country: "India", matches: 275, runs: 12898, imageName: "squadPlayerImg"),
        PlayerData(firstName: "Rohit", lastName: "Sharma", role: "Batter", country: "India", matches: 243, runs: 9837, imageName: "squadPlayerImg")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Sadda Squad")
                .foregroundColor(CustomColor.getColor(named: .white_FFFFFF))
                .font(.custom(CustomFonts.MontserratBold.name, size: 18))
            
            Image("shortsSeperator")
            
            Spacer()
            
            PlayerCarouselView(players: players, selectedIndex: $selectedIndex)
            
            Spacer()
            
            HomeMoreView()
                
            
        }
        .frame(height: 600)
        .padding()
        .background(CustomColor.getColor(named: .red_ED1C24))
    }
}



struct PlayerCarouselView: View {
    let players: [PlayerData]
    @Binding var selectedIndex: Int
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                ForEach(players.indices, id: \.self) { index in
                    PlayerCardView(player: players[index], onPrevious: {
                        if selectedIndex > 0 {
                            withAnimation {
                                selectedIndex -= 1
                            }
                        }
                    }, onNext: {
                        if selectedIndex < players.count - 1 {
                            withAnimation {
                                selectedIndex += 1
                            }
                        }
                    })
                    .frame(width: geo.size.width)
                }
            }
            .offset(x: -CGFloat(selectedIndex) * geo.size.width)
            .animation(.easeInOut(duration: 0.3), value: selectedIndex)
        }
        .frame(height: 450)
    }
}

struct PlayerCardView: View {
    let player: PlayerData
    let onPrevious: () -> Void
    let onNext: () -> Void

    var body: some View {
        VStack(spacing: 10) {
            Image(player.imageName)
                .resizable()
                .frame(height: 300)
                .scaledToFill()
            
            HStack {
                Button(action: onPrevious) {
                    Image("squadLeftArrow")
                }
                
                Spacer()
                
                VStack(spacing: 4) {
                    Text(player.firstName)
                        .font(.custom(CustomFonts.MontserratMedium.name, size: 36))
                    Text(player.lastName)
                        .font(.custom(CustomFonts.MontserratBold.name, size: 42))
                }
                .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                
                Spacer()
                
                Button(action: onNext) {
                    Image("squadRightArrow")
                }
            }
            .padding(.horizontal, 16)
            
            Divider()
                .frame(height: 1)
                .background(CustomColor.getColor(named: .grey_light_BDBDBD).opacity(0.8))
            
            HStack(spacing: 10) {
                Spacer()
                Text(player.role)
                    .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                
                Rectangle()
                    .frame(width: 1, height: 15)
                    .foregroundStyle(CustomColor.getColor(named: .grey_light_BDBDBD).opacity(0.8))
                
                Image("india")
                    .resizable()
                    .frame(width: 20, height: 14)
                
                Text(player.country)
                    .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                Spacer()
            }
            .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
            
            Divider()
                .frame(height: 1)
                .background(CustomColor.getColor(named: .grey_light_BDBDBD).opacity(0.8))
            
            HStack {
                Spacer()
                VStack {
                    Text("MATCHES")
                        .font(.custom(CustomFonts.MontserratBold.name, size: 12))
                    Text("\(player.matches)")
                        .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                }
                
                Spacer()
                
                Rectangle()
                    .frame(width: 1, height: 30)
                    .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                
                Spacer()
                
                VStack {
                    Text("RUNS")
                        .font(.custom(CustomFonts.MontserratBold.name, size: 12))
                    Text("\(player.runs)")
                        .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
        }
        .frame(height: 400)
    }
}

#Preview {
    SaddaSquad()
}
