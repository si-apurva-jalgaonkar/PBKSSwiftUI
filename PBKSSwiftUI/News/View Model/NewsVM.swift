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
    
    let serviceManager = ServiceManager()

    func fetchList(listingURL: String) async {
        serviceManager.makeGetRequest(url: listingURL, type: SIFeedsListingModel.self) { [weak self] response in
            guard let self = self else {return}
            switch response {
            case .success(let returnedResponse):
                news = returnedResponse
                //                    onSuccess()
            case .failure(let error): break
                //                    onFailure(error)
            }
        }
    }
    
    func fetchDetail(detailURL: String) async {
        serviceManager.makeGetRequest(url: detailURL, type: SIFeedsDetailModel.self) { [weak self] response in
            guard let self = self else {return}
            switch response {
            case .success(let returnedResponse):
                newsDetail = returnedResponse
                print(returnedResponse)
                //                    onSuccess()
            case .failure(let error): break
                //                    onFailure(error)
            }
        }
    }
}


