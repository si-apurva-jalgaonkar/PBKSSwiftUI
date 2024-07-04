//
//  VideosData.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 24/06/24.
//

import Foundation

struct VideosData: Identifiable {
    var id: Int
    var imageName: String
    var date: String
    var title: String
}

let videoData = [
    VideosData(id: 1, imageName: "videosLarge", date: "26 Mar, 2024", title:"Shikhar Dhawan achieves incredible feat, becomes third batter to slam 50 half-centuries jkdsjfjkadfjhakdjhfjk"),
    VideosData(id: 2, imageName: "videosSmall", date: "26 Mar, 2024", title:"Ashutosh Sharma achieves incredible feat, becomes third batter to slam 50 half-centuries"),
    VideosData(id: 3, imageName: "videosSmall", date: "26 Mar, 2024", title:"Shashank Singh achieves incredible feat, becomes third batter to slam 50 half-centuries"),
    VideosData(id: 4, imageName: "videosSmall", date: "26 Mar, 2024", title:"Sam Curran achieves incredible feat, becomes third batter to slam 50 half-centuries"),
    VideosData(id: 5, imageName: "videosSmall", date: "26 Mar, 2024", title:"Rishi Dhawan achieves incredible feat, becomes third batter to slam 50 half-centuries")
]
