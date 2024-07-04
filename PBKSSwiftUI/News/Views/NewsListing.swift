//
//  NewsListing.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 19/06/24.
//

import SwiftUI

struct NewsListing: View {
    
    @ObservedObject var viewModel: NewsVM
    let baseURL = "https://www.punjabkingsipl.in/static-assets/waf-images/{image_path}/{image_name}?v=1.04"
    let listingURL = "https://www.punjabkingsipl.in/apiv3/listing?entities=4&otherent=,1,8021&exclent=9362&pgnum=1&inum=10&pgsize=10"
    
    
    @State private var selectedDate: String?
    @State private var selectedTitle: String?
    @State private var selectedTitleAlias: String?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    if let items = viewModel.news?.content?.items {
                        ForEach(Array(items.enumerated()), id: \.element.assetID) { index, item in
                            if let date = item.publishedDate,
                               let title = item.assetTitle,
                               let titleAlias = item.titleAlias,
                               let imagePath = item.imagePath,
                               let imageName = item.imageFileName {
                                
                                let formattedDate = formatDateString(date)
                                let imageURL = constructImageURL(baseURL: baseURL, imagePath: imagePath, imageName: imageName)
                                
                                NavigationLink(destination: NewsDetail(date: selectedDate ?? "",
                                                                         title: selectedTitle ?? "",
                                                                         titleAlias: selectedTitleAlias ?? "",
                                                                         viewModel: NewsVM())) {
                                    NewsSmallContentItem(date: formattedDate,
                                                         title: title,
                                                         imageURL: imageURL)
                                }
                                .simultaneousGesture(TapGesture().onEnded {
                                    selectedDate = formattedDate
                                    selectedTitle = title
                                    selectedTitleAlias = titleAlias
                                })
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .padding([.horizontal, .bottom], 10)
            }
            .navigationBarTitle("News", displayMode: .inline)
            .foregroundStyle(Color.black)
        }
        .accentColor(Color.black)
        .onAppear {
            Task {
                await viewModel.fetchList(listingURL: listingURL)
            }
        }
        .scrollIndicators(.hidden)
    }
}

//#Preview {
//    NewsListing(viewModel: NewsVM())
//}
