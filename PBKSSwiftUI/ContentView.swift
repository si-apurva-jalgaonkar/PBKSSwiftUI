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
//        case newsDetail
        case menu
        case home
    }
    
    var body: some View {
        VStack {
            
            
            switch selectedTabs {
            case .videosListing:
                VideosListing()
//            case .videosDetail:
//                VideosDetail(date: "", title: "", titleAlias: "", videoUrl: "", viewModel: VideosVM())
            case .home:
                HomeVC()
            case .newsListing:
                NewsListing(viewModel: NewsVM())
//            case .newsDetail:
//                NewsDetail(date: "", title: "", titleAlias: "", viewModel: NewsVM())
            case .menu:
                MenuView()
            }
            CustomTabBar(selectedTabs: $selectedTabs)

            
//            Login(mobileNumber: "")
            
          
        }
    }
}

#Preview {
    ContentView()
    
}
