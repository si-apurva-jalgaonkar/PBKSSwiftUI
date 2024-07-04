//
//  Gender.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 01/07/24.
//

import Foundation

struct Gender: Identifiable {
    var id: String { type }
    let type: String
//    let code: String
//    let image: String
}

let genderNames: [Gender] = [
    Gender(type: "Male"),
    Gender(type: "Female"),
    Gender(type: "Prefer not to say")
//    Gender(name: "USA", code: "+1", image: "india"),
//    Gender(name: "UK", code: "+44", image: "india"),
    // Add more country codes as needed
]
