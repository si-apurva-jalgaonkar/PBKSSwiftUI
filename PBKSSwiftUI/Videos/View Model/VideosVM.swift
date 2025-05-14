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
    
    let serviceManager = ServiceManager()
    
    func fetchList(listingURL: String) async {
        serviceManager.makeGetRequest(url: listingURL, type: SIFeedsListingModel.self) { [weak self] response in
            guard let self = self else {return}
            switch response {
            case .success(let returnedResponse):
                videos = returnedResponse
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
                videosDetail = returnedResponse
                print(returnedResponse)
                //                    onSuccess()
            case .failure(let error): break
                //                    onFailure(error)
            }
        }
    }
}


