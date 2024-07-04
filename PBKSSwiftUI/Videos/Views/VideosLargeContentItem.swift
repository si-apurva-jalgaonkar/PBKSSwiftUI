//
//  VideosLargeContentItem.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 20/06/24.
//

import SwiftUI

struct VideosLargeContentItem: View {
    
//    var videosData: VideosData
    var date: String
    var title: String
    var imageURL: String
    var duration: String
    
    func shareButtonPressed() {
        print("Share button was pressed")
    }
    
    func likeButtonPressed() {
        print("Like button was pressed")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            ZStack(alignment: .bottomLeading) {
                //                Image(imageURL)
                //                    .resizable()
                //                    .frame(height: 270)
                AsyncImage(url: URL(string: imageURL)) { image in
                    image.image?.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 20, height: 270)
                        .cornerRadius(5)
                }
                
                Image("videoIcon")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.leading, 20)
                    .padding(.bottom, 20)

            }
            .overlay(alignment: .bottomTrailing) {
                ZStack {
                    HStack(alignment: .center) {
                        Image("timer")
                        Text(duration)
                            .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                            .foregroundStyle(CustomColor.getColor(named: .black_212121))
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                }
                .background(CustomColor.getColor(named: .grey_FEFFFF))
                .cornerRadius(5)
            }
            
            
            
            
            Text(date)
                .foregroundStyle(CustomColor.getColor(named: .red_ED1C24))
                .bold()
                .font(.custom(CustomFonts.MontserratBold.name, size: 12))
            
            Text(title)
                .lineLimit(2)
                .font(.custom(CustomFonts.MontserratBold.name, size: 16))
                .foregroundStyle(CustomColor.getColor(named: .black_212121))
                .multilineTextAlignment(.leading)
            
            HStack {
                
                Button(action: {
                    shareButtonPressed()
                }) {
                    Image("share")
                        .resizable().frame(width: 30, height: 30)
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
            .padding(.top, 10)
        }
    }
}

#Preview {
    VideosLargeContentItem(date: "sghah", title: "gsgahg", imageURL: "https://www.punjabkingsipl.in/static-assets/waf-images/71/f7/7f/0//D9OIFrgKEQ.png?v=1.04", duration: "")
}
