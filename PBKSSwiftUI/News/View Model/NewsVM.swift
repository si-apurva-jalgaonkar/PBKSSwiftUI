//
//  NewsVM.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 27/06/24.
//

import Foundation

@MainActor
class NewsVM: ObservableObject {
    @Published var news: SIFeedsListingModel?
    @Published var newsDetail: SIFeedsDetailModel?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    let serviceManager = ServiceManager()
    
    func fetchList(listingURL: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedNews = try await serviceManager.fetchListingData(listingURL: listingURL)
            news = fetchedNews
        } catch {
            errorMessage = "Failed to fetch user data: \(error.localizedDescription)"
        }
        isLoading = false
    }
    
    func fetchDetail(detailURL: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedNewsDetail = try await serviceManager.fetchDetailData(detailURL: detailURL)
            newsDetail = fetchedNewsDetail
        } catch {
            errorMessage = "Failed to fetch user data: \(error.localizedDescription)"
        }
        isLoading = false
    }
   
//    func fetchDetail(detailURL: String) async {
//            isLoading = true
//            errorMessage = nil
//            do {
//                let fetchedNewsDetail = try await serviceManager.fetchDetailData(detailURL: detailURL)
//                print("Fetched News Detail: \(fetchedNewsDetail)")
//                newsDetail = fetchedNewsDetail
//            } catch {
//                errorMessage = "Failed to fetch news detail: \(error.localizedDescription)"
//                print("Error fetching news detail: \(error.localizedDescription)")
//            }
//            isLoading = false
//        }
    
    
}


