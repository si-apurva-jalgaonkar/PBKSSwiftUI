//
//  Login.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 28/06/24.
//

import SwiftUI

struct Login: View {
    
    @State var mobileNumber: String
    @State private var selectedCountryCode: CountryCode = countryCodes.first!
    @State private var showCountryCodePicker = false
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView{
            VStack {
                HeaderImage()
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    Text("Welcome to The Den!")
                        .font(.custom(CustomFonts.MontserratBold.name, size: 20))
                        .foregroundStyle(CustomColor.getColor(named: .red_ED1C24))
                    Text("To personalise your experience, please login.")
                        .font(.custom(CustomFonts.MontserratMedium.name, size: 12))
                        .foregroundStyle(CustomColor.getColor(named: .grey_616161))
                    HStack {
                        Text("Verify your mobile number")
                            .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                            .foregroundStyle(CustomColor.getColor(named: .grey_616161))
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
                    .padding(.top, 5)
                    
                    HStack {
                        Button(action: {
                            showCountryCodePicker.toggle()
                        }) {
                            HStack(spacing: 10) {
                                Image("india")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text(selectedCountryCode.code)
                                    .font(.custom(CustomFonts.MontserratMedium.name, size: 16))
                                    .frame(height: 58)
                                    .foregroundStyle(CustomColor.getColor(named: .black_212121))
                                Image("dropdownArrow")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                            }
                            .padding(.horizontal, 15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(CustomColor.getColor(named: .grey_light_BDBDBD), lineWidth: 1)
                            )
                        }
                        
                        FloatingTextField(placeholderText: "Mobile Number*")
                            .onTextChange { oldValue, newValue in
                                print(newValue)
                            }
                        
//                        TextField("Mobile Number", text: $mobileNumber)
//                            .multilineTextAlignment(.center)
//                            .font(.custom(CustomFonts.MontserratMedium.name, size: 16))
//                            .frame(height: 58)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 5)
//                                    .stroke(CustomColor.getColor(named: .grey_light_BDBDBD), lineWidth: 1)
//                            )
                    }
                    .padding(.top, 5)
                    
                    
                    VStack{
                        NavigationLink(isActive: $isActive) {
                            LoginOTP(OTP: "")
                        } label: {
                            Button("Send Code") {
                                isActive = true
                            }
                            .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                            .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                            .frame(width: 370, height: 44)
                            .background(CustomColor.getColor(named: .red_ED1C24))
                            .cornerRadius(5)
                            .padding(.top)
                        }
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .sheet(isPresented: $showCountryCodePicker) {
            CountryCodePicker(selectedCountryCode: $selectedCountryCode, showPicker: $showCountryCodePicker)
        }
    }
}

struct CountryCodePicker: View {
    @Binding var selectedCountryCode: CountryCode
    @Binding var showPicker: Bool
    
    var body: some View {
        NavigationView {
            List(countryCodes) { countryCode in
                Button(action: {
                    selectedCountryCode = countryCode
                    showPicker = false
                }) {
                    HStack {
                        Text(countryCode.name)
                        Spacer()
                        Text(countryCode.code)
                    }
                }
            }
            .navigationTitle("Select Country Code")
            .navigationBarItems(trailing: Button("Done") {
                showPicker = false
            })
        }
    }
}

#Preview{
    Login(mobileNumber: "")
}
