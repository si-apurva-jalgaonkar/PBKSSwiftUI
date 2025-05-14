//
//  FanPoll.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 08/05/25.
//

import SwiftUI

struct FanPoll: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("FanVoice: Have Your Say in the Game!")
                .foregroundStyle(CustomColor.getColor(named: .black_212121))
                .font(.custom(CustomFonts.MontserratBold.name, size: 18))
            
            Image("homeSeperator")
            
            Text("Which bowler will take the most wickers in the IPL 2024?")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<4) {index in
                        PollItems()
                    }
                }
            }
            PollVoteBtnView()
        }
        .padding()
    }
}

struct PollItems: View {
    var body: some View {
        ZStack {
            Image("fanPollImg")
                .resizable()
                .frame(width: 153, height: 230)
            
            VStack {
                HStack {
                    Spacer()
                    Circle()
                        .strokeBorder(CustomColor.getColor(named: .white_FFFFFF), lineWidth: 1)
                        .fill(CustomColor.getColor(named: .white_FFFFFF).opacity(0.25))
                        .frame(width: 20, height: 20)
                    
                }
                .padding(10)
                Spacer()
                
                
                Rectangle()
                    .fill(CustomColor.getColor(named: .black_212121).opacity(0.8))
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .overlay {
                        VStack(alignment: .leading) {
                            Text("Arshdeep")
                            Text("Singh")
                        }
                        .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.all, 10)
                    }
            }
            
        }
        .frame(width: 153, height: 230)
    }
}


struct PollVoteBtnView: View {
    var body: some View {
        Button {
            print("Button clicked")
        } label: {
            Text("VOTE NOW")
                .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
        }
        .frame(maxWidth: .infinity, minHeight: 34)
        .background(CustomColor.getColor(named: .red_ED1C24))
        .cornerRadius(5)
        
    }
}

#Preview {
    FanPoll()
}
