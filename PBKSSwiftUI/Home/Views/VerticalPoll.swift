//
//  VerticalPoll.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 08/05/25.
//

import SwiftUI

struct VerticalPoll: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Which bowler will take the most wickers in the IPL 2024?")
            ForEach(0..<4) {index in
                VerticalItems()
            }
            
            VoteBtnView()
        }
        .padding()
    }
}

struct VerticalItems: View {
    var body: some View {
        Rectangle()
            .cornerRadius(10)
            .frame(height: 42)
            .shadow(radius: 2, y: 2)
            .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
            .overlay {
                HStack(spacing: 10) {
                    Circle()
                        .strokeBorder(.black, lineWidth: 1)
                        .frame(width: 16, height: 16)
                    
                    Text("Arshdeep Singh")
                    Spacer()
                }
                .padding()
            }
    }
}

struct VoteBtnView: View {
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
    VerticalPoll()
}
