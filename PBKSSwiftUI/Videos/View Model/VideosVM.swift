//
//  VideosVM.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 25/06/24.
//

import Foundation

@MainActor
class VideosVM: ObservableObject {
    @Published var videos: SIFeedsListingModel?
    @Published var videosDetail: SIFeedsDetailModel?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    let serviceManager = ServiceManager()
    
    func fetchList(listingURL: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedVideos = try await serviceManager.fetchListingData(listingURL: listingURL)
            videos = fetchedVideos
        } catch {
            errorMessage = "Failed to fetch user data: \(error.localizedDescription)"
        }
        isLoading = false
    }
    
    func fetchDetail(detailURL: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedVideosDetail = try await serviceManager.fetchDetailData(detailURL: detailURL)
            videosDetail = fetchedVideosDetail
        } catch {
            errorMessage = "Failed to fetch user data: \(error.localizedDescription)"
        }
        isLoading = false
    }
}


