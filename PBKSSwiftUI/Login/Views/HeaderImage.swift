//
//  HeaderImage.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 01/07/24.
//

import SwiftUI

struct HeaderImage: View {
    var body: some View {
        Image("loginHeader")
            .resizable()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
    }
}

#Preview {
    HeaderImage()
}
