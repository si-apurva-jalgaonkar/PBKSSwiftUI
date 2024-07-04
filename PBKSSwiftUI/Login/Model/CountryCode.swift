//
//  CountryCode.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 01/07/24.
//

import Foundation

struct CountryCode: Identifiable {
    var id: String { code }
    let name: String
    let code: String
    let image: String
}

let countryCodes: [CountryCode] = [
    CountryCode(name: "India", code: "+91", image: "india"),
    CountryCode(name: "USA", code: "+1", image: "india"),
    CountryCode(name: "UK", code: "+44", image: "india"),
    // Add more country codes as needed
]
