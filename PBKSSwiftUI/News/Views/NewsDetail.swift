//
//  NewsDetail.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 19/06/24.
//

import SwiftUI

struct NewsDetail: View {

    var date: String
    var title: String
    var titleAlias: String
    @ObservedObject var viewModel: NewsVM

    
    let baseURL = "https://www.punjabkingsipl.in/static-assets/waf-images/{image_path}/{image_name}?v=1.04"
    let detailBaseURL = "https://www.punjabkingsipl.in/apiv3/article/{title_alias}?is_app=1"
    let listingURL = "https://www.punjabkingsipl.in/apiv3/listing?entities=4&otherent=,1,8021&exclent=9362&pgnum=1&inum=10&pgsize=10"
    
    
//    var htmlString = viewModel.newsDetail?.content?.data?.fullText ?? ""
//        dataController.htmlString = htmlString
//        let font: UIFont = .customFont(customFont: .montserratRegular, size: 14)
//        let textColor = "#616161"
//        let bodyColor = UIColor.getColor(colorName: .clear)
    
    private var detailURL: String {
        constructDetailURL(baseDetailURL: detailBaseURL, titleAlias: titleAlias)
    }
    
    func shareButtonPressed() {
        print("Share button was pressed")
    }
    
    func likeButtonPressed() {
        print("Like button was pressed")
    }

    
    private var htmlString: String {
            guard let rawHtml = viewModel.newsDetail?.content?.data?.fullText else {
                return "<html><body><p>Loading content...</p></body></html>"
            }
            
            let font = "Montserrat"
            let fontSize = "14px"
            let textColor = "#616161"
            let backgroundColor = "#ffffff"
            let strongWeight = "600"
            let linkColor = "#ed1c24"
            
            var styledHtml = """
            <html>
            <header>
                <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'>
            </header>
            <head>
                <link href='https://fonts.googleapis.com/css2?family=\(font):ital,wght@0,100..900;1,100..900&display=swap' rel='stylesheet'>
                <style>
                    body { font-family: '\(font)'; font-style: normal; font-weight: 400; font-size: \(fontSize); line-height: 22px; color: \(textColor); background-color: \(backgroundColor); }
                    strong { font-weight: \(strongWeight); }
                    a { color: \(linkColor); }
                    .table-responsive { display: block; overflow-x: auto; margin-top: 20px; margin-bottom: 20px; }
                </style>
            </head>
            <body>\(rawHtml)</body>
            </html>
            """
            
            styledHtml = styledHtml.replacingOccurrences(of: "//www.instagram.com/embed.js", with: "https://www.instagram.com/embed.js")
            
            return styledHtml
        }
        
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image("newsDetailHeader")
                    .resizable()
                    .frame(height: 600)
                
                    .overlay(
                        VStack(alignment: .leading, spacing: 10){
                            Spacer()
                            Text(date)
                                .foregroundStyle(CustomColor.getColor(named: .grey_light_BDBDBD))
                                .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                            
                            Text(title)
                                .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                                .font(.custom(CustomFonts.MontserratBold.name, size: 24))
                            
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
                        .padding(.all, 15)
                        
                    )
                   
                       

                        

                        
                        Spacer()
           
//                WebView(url: URL(string: "https://stg-kkr.sportz.io/corporate-governance?webview=true")!)
//                    .frame(height: 500)
                
//                WebView(htmlString: "<html><header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header><head><link href='https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap' rel='stylesheet'><style>body{ font-family: 'Montserrat'; font-style: normal; font-weight: 400; font-size: 14px; line-height: 22px; color: #616161; background-color: #ffffff;} strong{ font-weight: 600;} a{ color: #ed1c24;} .table-responsive{ display: block; overflow-x: auto; margin-top: 20px; margin-bottom: 20px;}</style></head><body>\(htmlString)</body></html>"
//                        htmlString = htmlString.replacingOccurrences(of: "//www.instagram.com/embed.js", with: "https://www.instagram.com/embed.js")
//                               .frame(height: 400)
//                WebView(htmlString: htmlString)
//                                    .frame(height: 500)
//                                    .background(Color.red)
                
                
                if viewModel.newsDetail?.content?.data?.fullText != nil {
                                    WebView(htmlString: htmlString)
                                        .frame(height: 500)
                                        .background(Color.red)
                                        .onAppear {
                                            print("News detail content loaded")
                                        }
                                } else {
                                    Text("Loading content...")
                                        .frame(height: 500)
                                        .background(Color.red)
                                        .onAppear {
                                            print("News detail content is nil")
                                        }
                                }
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading) {
                    Text("Related Article")
                        .padding(.horizontal)
                        .font(.custom(CustomFonts.MontserratBold.name, size: 18))
                    
                    Image("detailsDivider")
                        .resizable()
                    .padding(.horizontal)
                }
                .padding(.vertical)
                
//                ForEach(0..<5) { index in
//                    NewsSmallContentItem()
//                }
                VStack(spacing: 15) {
                    if let items = viewModel.news?.content?.items {
                        ForEach(Array(items.enumerated()), id: \.element.assetID) { index, item in
                            if let imagePath = item.imagePath,
                                let imageName = item.imageFileName {
                                let imageURL = constructImageURL(baseURL: baseURL, imagePath: imagePath, imageName: imageName)
                                
                                NavigationLink {
                                    NewsDetail(date: date, title: title, titleAlias: titleAlias, viewModel: NewsVM())
                                } label: {
                                    NewsSmallContentItem(date: formatDateString(item.publishedDate ?? ""),
                                                           title: item.assetTitle ?? "",
                                                           imageURL: imageURL)
                                }
                                
                                
                            }
                        }
                    }
                    
                }
                .padding(.horizontal)
                
            }
            .onAppear {
                Task {
                    await viewModel.fetchList(listingURL: listingURL)
                    await viewModel.fetchDetail(detailURL: detailURL)
                }
            }
        }
    }
}

//#Preview {
//    NewsDetail()
//}


