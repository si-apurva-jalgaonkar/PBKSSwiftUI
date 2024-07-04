//
//  LoginOTP.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 01/07/24.
//

import SwiftUI

struct LoginOTP: View {
    
    @State var OTP: String
    @State var isChecked: [Bool] = [false, false]
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                HeaderImage()
                    .padding(.bottom)
                
                ScrollView{
                    HStack(){
                        Text("OTP Verification")
                            .font(.custom(CustomFonts.MontserratBold.name, size: 20))
                        
                        Spacer()
                        
                        Button(action: {
                            print("skip")
                        }) {
                            Text("Skip")
                                .font(.custom(CustomFonts.MontserratRegular.name, size: 14))
                                .foregroundColor(CustomColor.getColor(named: .grey_616161))
                                .underline()
                        }
                    }
                    
                    
                    HStack {
                        Text("Enter the OTP sent on +91 8023456789 to proceed")
                            .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                            .foregroundStyle(CustomColor.getColor(named: .grey_616161))
                        Spacer()
                    }
                    .padding(.top, 5)
                    
                    HStack {
                        ForEach(0..<6){ index in
                            TextField("-", text: $OTP)
                        }
                        .frame(height: 48)
                        .border(CustomColor.getColor(named: .grey_light_BDBDBD))
                        .multilineTextAlignment(.center)
                    }
                    .padding(.top, 15)
                    
                    HStack {
                        Text("Didn't receive the OTP?")
                            .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
                            .foregroundStyle(CustomColor.getColor(named: .grey_616161))
                        
                        Spacer()
                        Button(action: {
                            print("RESEND OTP")
                        }) {
                            Text("RESEND OTP")
                                .font(.custom(CustomFonts.MontserratBold.name, size: 12))
                                .foregroundStyle(CustomColor.getColor(named: .red_ED1C24))
                            
                        }
                    }
                    .padding(.top, 5)
                    
                    HStack{
                        Spacer()
                        Text("Time Remaining : 20 sec")
                            .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
                            .foregroundStyle(CustomColor.getColor(named: .grey_616161))
                    }
                    .padding(.top, 5)
                    
                    HStack(alignment: .top) {
                        Button(action: {
                            isChecked[0].toggle()
                        }, label: {
                            Image(isChecked[0] ? "yellowTickBox" : "checkBox" )
                                .resizable()
                                .frame(width: 24, height: 24)
                        })
                        
                        Text("Disclaimer: Your information may be used by K.P.H. Dream Cricket Pvt. Ltd. and made available to our sponsors and third-parties to provide you with news and promotional information about Punjab Kings and enhance your app experience. By submitting this form you agree to the collection and processing of the same. For further information, please consult our Online Privacy Policy.")
                            .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
                            .foregroundStyle(CustomColor.getColor(named: .black_212121))
                    }
                    .padding(.top, 5)
                    
                    HStack(alignment: .top) {
                        
                        Button(action: {
                            isChecked[1].toggle()
                        }, label: {
                            Image(isChecked[1] ? "yellowTickBox" : "checkBox" )
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            
                        })
                        
                        
                        Text("I acknowledge that I have read and agree to the Terms & Conditions.")
                            .font(.custom(CustomFonts.MontserratRegular.name, size: 12))
                            .foregroundStyle(CustomColor.getColor(named: .black_212121))
                    }
                    .padding(.top, 5)
                    
                    
                    VStack{
                        NavigationLink(isActive: $isActive) {
                            LoginCompleteProfile(firstName: "", lastName: "")
                        } label: {
                            Button("Verify & Proceed") {
                                isActive = true
                                
                            }
                            .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                            .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                            .frame(width: 370, height: 44)
                            .background(CustomColor.getColor(named: .red_ED1C24))
                            .cornerRadius(5)
                            .padding(.top, 5)
                        }
                    }
                }
                .padding()
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    LoginOTP(OTP: "")
}
