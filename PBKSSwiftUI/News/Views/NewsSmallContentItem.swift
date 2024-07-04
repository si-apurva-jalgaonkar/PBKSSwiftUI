//
//  NewsSmallContentItem.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 19/06/24.
//

import SwiftUI

struct NewsSmallContentItem: View {
    
    var date: String
    var title: String
    var imageURL: String
    
    func shareButtonPressed() {
        print("Share button was pressed")
    }
    
    func likeButtonPressed() {
        print("Like button was pressed")
    }
    
    var body: some View {
        HStack(alignment: .top) {
           
//            Image("newsSmall")
//                .resizable()
//                .scaledToFill()
//                .cornerRadius(3)
//                .frame(width: 186, height: 95)
////                .padding(.leading, 10)
//                .padding(.vertical, 10)
                
            AsyncImage(url: URL(string: imageURL)) { image in
                image.image?.resizable()
//                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width / 2.5 , height: 100)
                    .cornerRadius(5)
            }
            VStack(alignment: .leading, spacing: 10) {
                
                Text(date)
                    .foregroundStyle(CustomColor.getColor(named: .red_ED1C24))
                    .font(.custom(CustomFonts.MontserratBold.name, size: 12))
                    .multilineTextAlignment(.leading)
                
                 
                
                Text(title)
                    .lineLimit(2)
                    .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                    .foregroundStyle(CustomColor.getColor(named: .black_212121))
                    .multilineTextAlignment(.leading)
                    
                
                HStack {
                    Button(action: {
                        shareButtonPressed()
                    }) {
                        Image("share")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        likeButtonPressed()
                    }) {
                        Image("like")
                            .resizable()
                            .frame(width: 66, height: 30)
                    }
                }
//                .padding(.top, 10)

            }
            Spacer()
        }
        .frame(height: 110)
    }
}

//#Preview {
//    NewsSmallContentItem()
//}
