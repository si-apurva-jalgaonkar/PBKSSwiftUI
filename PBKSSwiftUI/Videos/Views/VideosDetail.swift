//
//  VideosDetail.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 20/06/24.
//

import SwiftUI

struct VideosDetail: View {
    
//    var videosData: VideosData
    
    var date: String
    var title: String
    var titleAlias: String
    @ObservedObject var viewModel: VideosVM
    
    @Environment(\.dismiss) var dismiss
    
    let baseURL = "https://www.punjabkingsipl.in/static-assets/waf-images/{image_path}/{image_name}?v=1.04"
    let detailBaseURL = "https://www.punjabkingsipl.in/apiv3/photo/{title_alias}?is_app=1"
    let listingURL = "https://www.punjabkingsipl.in/apiv3/listing?entities=4,3&otherent=&exclent=&pgnum=1&inum=10&pgsize=10"
    
    private var detailURL: String {
        constructDetailURL(baseDetailURL: detailBaseURL, titleAlias: titleAlias)
    }
    
    
    
    func shareButtonPressed() {
        print("Share button was pressed")
    }
    
    func likeButtonPressed() {
        print("Like button was pressed")
    }
    
    
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Image("videosLarge")
                    .resizable()
                    .frame(width: 375, height: 280)
                
                Text(date)
                    .foregroundStyle(.red)
                    .bold()
                    .font(.subheadline).bold()
                    .font(.system(size: 12))
                
                
                Text(title)
                    .lineLimit(2)
                    .font(.title3).bold()
                    .font(.system(size: 16))
                
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
            }
            .padding(.horizontal, 10)
            
            VStack(alignment: .leading) {
                Text("BKT Tires Challenge")
                    .padding(.horizontal)
                    .font(.custom(CustomFonts.MontserratBold.name, size: 18))
                
                Image("detailsDivider")
                    .resizable()
                .padding(.horizontal)
            }
            .padding(.vertical)
            
            VStack(spacing: 15) {
                if let items = viewModel.videos?.content?.items {
                    ForEach(Array(items.enumerated()), id: \.element.assetID) { index, item in
                        if let imagePath = item.imagePath, 
                            let imageName = item.imageFileName {
                            let imageURL = constructImageURL(baseURL: baseURL, imagePath: imagePath, imageName: imageName)
                            
                            NavigationLink {
                                VideosDetail(date: date, title: title, titleAlias: titleAlias, viewModel: VideosVM())
                            } label: {
                                VideosSmallContentItem(date: formatDateString(item.publishedDate ?? ""),
                                                       title: item.assetTitle ?? "",
                                                       imageURL: imageURL)
                            }
                        }
                    }
                }
                
            }
            
            .padding(.horizontal, 10)
            .onAppear {
                Task {
                    await viewModel.fetchList(listingURL: listingURL)
                    await viewModel.fetchDetail(detailURL: detailURL)
                }
            }
        }
        
        .scrollIndicators(.hidden)
    }
}

//#Preview {
//    VideosDetail(date: "6264278", title: "hfejfhuhef", titleAlias: "fjkdjfk", viewModel: VideosVM())
//}
