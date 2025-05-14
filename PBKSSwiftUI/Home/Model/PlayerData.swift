//
//  PlayerData.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 09/05/25.
//

import SwiftUI

struct PlayerData: Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let role: String
    let country: String
    let matches: Int
    let runs: Int
    let imageName: String
}
