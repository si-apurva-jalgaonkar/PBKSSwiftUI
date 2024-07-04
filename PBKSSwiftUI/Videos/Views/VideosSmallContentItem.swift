//
//  VideosSmallContentItem.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 20/06/24.
//

import SwiftUI

struct VideosSmallContentItem: View {
    
//    var videosData: VideosData
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
           
            ZStack(alignment: .bottomLeading) {
                //                Image("videosSmall")
                //                Image(imageURL)
                //                    .resizable()
                //                    .scaledToFill()
                //                    .cornerRadius(5)
                //                    .frame(width: 168, height: 126)
                AsyncImage(url: URL(string: imageURL)) { image in
                    image.image?.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width / 2.3 , height: 126)
                        .cornerRadius(5)
                }
                
                Image("videoIcon")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.leading, 15)
                    .padding(.bottom, 15)
                    .shadow(radius: 40)
                
                
            }
            .overlay(alignment: .bottomTrailing) {
                ZStack {
                    HStack(alignment: .center) {
                        Image("timer")
                        Text("05:33")
                            .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                            .foregroundStyle(CustomColor.getColor(named: .black_212121))
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                }
                .background(CustomColor.getColor(named: .grey_FEFFFF))
                .cornerRadius(5)
            }

            

            VStack(alignment: .leading, spacing: 10) {
                
                Text(date)
                    .foregroundStyle(CustomColor.getColor(named: .red_ED1C24))
                    .font(.custom(CustomFonts.MontserratBold.name, size: 12))
                
               
                
                Text(title)
                    .lineLimit(2)
                    .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                    .foregroundColor(CustomColor.getColor(named: .black_212121))
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
                .padding(.top, 26)

            }
            .padding(.leading, 5)
            Spacer()
        }
        
        .frame(height: 126)
    }
}

//
#Preview {
//    VideosSmallContentItem(videosData: videoData[0])
    VideosSmallContentItem( date: "shgsdgua", title: "hsdua", imageURL: "https://www.punjabkingsipl.in/static-assets/waf-images/71/f7/7f/0//D9OIFrgKEQ.png?v=1.04")
}
