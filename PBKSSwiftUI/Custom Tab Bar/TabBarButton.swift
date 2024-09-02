//
//  TabBarButton.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 04/07/24.
//

import SwiftUI

struct TabBarButton: View {
    
    var buttonText: String
    var imageName: String
    var isActive: Bool
    
    var body: some View {
        
        GeometryReader { geo in
            
            if isActive {
                Rectangle()
                    .foregroundStyle(CustomColor.getColor(named: .black_212121))
                    .frame(width: geo.size.width/2, height: 4)
                    .padding(.leading, geo.size.width/4 )
            }
            
            VStack(alignment: .center, spacing: 4) {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text(buttonText)
                    .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

#Preview {
    TabBarButton(buttonText: "Videos Listing", imageName: "video.fill", isActive: true)
}
