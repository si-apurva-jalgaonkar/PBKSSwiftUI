//
//  CustomFonts.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 26/06/24.
//

import Foundation
import SwiftUI

enum CustomFonts: String, CaseIterable {
    case MontserratBold = "Montserrat-Bold"
    case MontserratRegular = "Montserrat-Regular"
    case MontserratMedium = "Montserrat-Medium"
    
    var name: String { self.rawValue }
}

enum CustomColor: String {
    
    static var currentBundle: Bundle? = Bundle(identifier: "net.sportzinteractive.PBKSPhotos")
    
    static func getColor(named colorName: CustomColor) -> Color {
        return Color(colorName.name, bundle: currentBundle)
    }
    
//    case white_FAF6FF
    case grey_FEFFFF
    case black_212121
    case red_ED1C24
    case white_FFFFFF
    case grey_light_BDBDBD
    case grey_616161

    var name: String {self.rawValue}
    
   
    
}


