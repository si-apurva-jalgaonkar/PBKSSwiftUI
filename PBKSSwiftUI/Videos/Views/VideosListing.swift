import SwiftUI

struct VideosListing: View {
    @StateObject private var viewModel = VideosVM()
    let baseURL = "https://www.punjabkingsipl.in/static-assets/waf-images/{image_path}/{image_name}?v=1.04"
    let listingURL = "https://www.punjabkingsipl.in/apiv3/listing?entities=4,3&otherent=&exclent=&pgnum=1&inum=10&pgsize=10"

    @State private var selectedDate: String?
    @State private var selectedTitle: String?
    @State private var selectedTitleAlias: String?
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack(alignment: .top) {
                    VStack(spacing: 20) {
                        //                        ForEach((viewModel.videos?.content?.items ?? []), id: \.id) { data in
                        
                        //                        }
                        //
                        //                        ForEach(viewModel.videos?.content?.items ?? []) { data in
                        //                            Text(data.audioURL ?? "")
                        //                        }
                        if let items = viewModel.videos?.content?.items {
                            ForEach(Array(items.enumerated()), id: \.element.assetID) { index, item in
                                if let date = item.publishedDate,
                                   let title = item.assetTitle,
                                   let titleAlias = item.titleAlias,
                                   let imagePath = item.imagePath,
                                   let duration = item.duration,
                                   let imageName = item.imageFileName {
                                    
                                    let formattedDate = formatDateString(date)
                                    let imageURL = constructImageURL(baseURL: baseURL, imagePath: imagePath, imageName: imageName)
                                    
                                    NavigationLink {
                                        VideosDetail(date: selectedDate ?? "",
                                                     title: selectedTitle ?? "",
                                                     titleAlias: selectedTitleAlias ?? "",
                                                     viewModel: VideosVM())
                                    } label: {
                                        if index == 0 || index == 1 {
                                            VideosLargeContentItem(date: formattedDate, title: title, imageURL: imageURL, duration: duration)
                                        } else if index == 2 || index == 3 {
                                            VideosSmallContentItem(date: formattedDate, title: title, imageURL: imageURL)
                                        } else {
                                            let offset = index - 4
                                            if offset % 4 == 0 || offset % 4 == 1 {
                                                VideosLargeContentItem(date: formattedDate, title: title, imageURL: imageURL, duration: duration)
                                            } else {
                                                VideosSmallContentItem(date: formattedDate, title: title, imageURL: imageURL)
                                            }
                                        }
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
            }
            .navigationBarTitle("Videos", displayMode: .inline)
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

