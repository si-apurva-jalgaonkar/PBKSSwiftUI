//
//  CustomTabBar.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 04/07/24.
//

import SwiftUI

enum Tabs: Int {
    case videosListing = 0
//    case videosDetail = 1
    case newsListing = 2
    //case newsDetail = 3
    case menu = 3
    case home = 1
}

struct CustomTabBar: View {
    
    @Binding var selectedTabs: Tabs
    
    var body: some View {
        
        HStack {
            
            Button(action: {
                selectedTabs = .videosListing
            }, label: {
                TabBarButton(
                    buttonText: "Videos Listing",
                    imageName: "video",
                    isActive: selectedTabs == .videosListing)
            })
            
//            Button(action: {
//                selectedTabs = .videosDetail
//            }, label: {
//                TabBarButton(
//                    buttonText: "Videos Details",
//                    imageName: "video.fill",
//                    isActive: selectedTabs == .videosDetail)
//            })
            
            Button(action: {
                selectedTabs = .home
            }, label: {
                TabBarButton(
                    buttonText: "Home",
                    imageName: "video.fill",
                    isActive: selectedTabs == .home)
            })
            
            Button(action: {
                selectedTabs = .newsListing
            }, label: {
                TabBarButton(
                    buttonText: "News Listing",
                    imageName: "newspaper",
                    isActive: selectedTabs == .newsListing)
            })
            
//            Button(action: {
//                selectedTabs = .newsDetail
//            }, label: {
//                TabBarButton(
//                    buttonText: "News Details",
//                    imageName: "newspaper.fill",
//                    isActive: selectedTabs == .newsDetail)
//            })
            
            Button(action: {
                selectedTabs = .menu
            }, label: {
                TabBarButton(
                    buttonText: "Menu",
                    imageName: "newspaper.fill",
                    isActive: selectedTabs == .menu)
            })
        }
        .frame(height: 80)
    }
}

#Preview {
    CustomTabBar(selectedTabs: .constant(.videosListing))
}
