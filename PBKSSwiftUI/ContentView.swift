//
//  ContentView.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 19/06/24.
//

import SwiftUI

struct ContentView: View {
    
//    var videosData: [VideosData]
    @State private var selection: Tab = .newsListing
    @State var selectedTabs: Tabs = .videosListing
    
    enum Tab {
        case videosListing
        case videosDetail
        case newsListing
        case newsDetail
    }
    
    var body: some View {
        VStack {
            
            
            switch selectedTabs {
            case .videosListing:
                VideosListing()
            case .videosDetail:
                VideosDetail(date: "", title: "", titleAlias: "", viewModel: VideosVM())
            case .newsListing:
                NewsListing(viewModel: NewsVM())
            case .newsDetail:
                NewsDetail(date: "", title: "", titleAlias: "", viewModel: NewsVM())
            }
            CustomTabBar(selectedTabs: $selectedTabs)
//            NewsListing()
//            VideosListing()
//            VideosDetail(date: "", title: "", titleAlias: "", viewModel: VideosVM())
            
//            TabView(selection: $selection) {
//                VideosListing()
//                    .tabItem {
//                        Label("Videos Listing", systemImage: "star")
//                    }
//                    .tag(Tab.videosListing)
//                
//                VideosDetail(date: "", title: "", titleAlias: "", viewModel: VideosVM())
//                    .tabItem {
//                        Label("Videos Details", systemImage: "star")
//                    }
//                    .tag(Tab.videosDetail)
//                
//                NewsListing(viewModel: NewsVM())
//                    .tabItem {
//                        Label("News Listing", systemImage: "star")
//                    }
//                    .tag(Tab.newsListing)
//                
//                NewsDetail(date: "", title: "", titleAlias: "", viewModel: NewsVM())
//                    .tabItem {
//                        Label("News Details", systemImage: "star")
//                    }
//                    .tag(Tab.newsDetail)
//            }
            
//            Login(mobileNumber: "")
            
          
        }
    }
}

#Preview {
    ContentView()
    
}
