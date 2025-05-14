//
//  MenuView.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 07/05/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing:0){
                LoginProfile()

                //inapp webview
                if let url = URL(string: "https://www.punjabkingsipl.in/points-table") {
                    NavigationLink(destination: WebView(url: url)) {
                        MenuItem()
                    }
                }

                //safari redirection
                //                Link(destination: URL(string: "https://www.punjabkingsipl.in/points-table")!) {
                //                    MenuItem()
                //                }
                
                //safari redirection
//                MenuItem()
//                    .onTapGesture {
//                        if let url = URL(string: "https://www.punjabkingsipl.in/points-table") {
//                            UIApplication.shared.open(url)
//                        }
//                    }
                
                //            MenuItem()
                //            MenuItem()
                Spacer()
                
                notificationView()
            }
            .frame(maxHeight: .infinity)
            .background(CustomColor.getColor(named: .red_ED1C24))
        }
    }
}

struct MenuItem: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Circle()
                    .foregroundStyle(Color.white)
                    .frame(width: 25, height: 25)
                    .overlay {
                        Image("menuImg")
                    }
                Text("Standings")
                    .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                Spacer()
            }
            .padding()
            //            Image("menuSeperator")
            Rectangle()
                .frame(height: 1)
                .padding(.horizontal, 20)
                .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
        }
    }
}

struct LoginProfile : View {
    var body: some View {
        HStack {
            Circle()
                .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                .frame(width: 50, height: 50)
                .overlay {
                    Image("menuImg")
                }
            
            Text("Login")
                .foregroundStyle(Color.white)
            
            Spacer()
            
            Circle()
                .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                .frame(width: 25, height: 25)
                .overlay {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 10, height: 10)
                }
        }
        .padding()
        Rectangle()
            .frame(height: 1)
            .padding(.horizontal, 20)
            .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
    }
    
}

struct notificationView : View {
    
    @State var toggleIsOn: Bool = true
    
    var body: some View {
        
        VStack {
            HStack {
                Circle()
                    .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                    .frame(width: 25, height: 25)
                    .overlay {
                        Image("menuImg")
                    }
                Text("Notifications")
                    .foregroundStyle(Color.white)
                Spacer()
                
                Toggle(isOn: $toggleIsOn ) {
                    Text("")
                }
                //.tint(Color.yellow.opacity(0.5))
                
                
            }
            .padding()
        }
        .background(CustomColor.getColor(named: .black_212121).opacity(0.2))
    }
}

#Preview {
    MenuView()
}
