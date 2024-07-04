//
//  LoginCompleteProfile.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 01/07/24.
//

import SwiftUI

struct LoginCompleteProfile: View {
    
    @State var firstName: String
    @State var lastName: String
    @State var isChecked: [Bool] = [false, false]
    @State private var selectedGender: Gender = genderNames.first!
    @State private var showGenderPicker = false
    
    var body: some View {
        VStack{
            HeaderImage()
                .padding(.bottom)
            
            
            
            ScrollView{
                
                HStack{
                    Text("Complete Your Profile")
                        .font(.custom(CustomFonts.MontserratBold.name, size: 20))
                        .foregroundStyle(CustomColor.getColor(named: .red_ED1C24))
                    Spacer()
                }
                
                VStack{
                    FloatingTextField(placeholderText: "First Name*")
                        .onTextChange { oldValue, newValue in
                            print(newValue)
                        }
                    
//                    TextField("First Name *", text: $firstName)
//                        .padding(.leading)
//                        .font(.custom(CustomFonts.MontserratMedium.name, size: 16))
//                        .frame(height: 58)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 5)
//                                .stroke(CustomColor.getColor(named: .grey_light_BDBDBD), lineWidth: 1)
//                        )
                    FloatingTextField(placeholderText: "Last Name*")
                        .onTextChange { oldValue, newValue in
                            print(newValue)
                        }
//                    TextField("Last Name *", text: $lastName)
//                        .padding(.leading)
//                        .font(.custom(CustomFonts.MontserratMedium.name, size: 16))
//                        .frame(height: 58)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 5)
//                                .stroke(CustomColor.getColor(named: .grey_light_BDBDBD), lineWidth: 1)
//                        )
                    
                    TextField("Gender *", text: $lastName)
                        .padding(.leading)
                        .font(.custom(CustomFonts.MontserratMedium.name, size: 16))
                        .frame(height: 58)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(CustomColor.getColor(named: .grey_light_BDBDBD), lineWidth: 1)
                        )
                        .overlay {
                            HStack {
                                Spacer()
                                Image("dropdownArrow")
                                    .resizable()
                                    .frame(width: 18, height: 18)
                            }
                            .padding()
                        }
                }
                
                
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
                
                Button("Verify & Proceed") {
                    print("verify & proceed")
                }
                .font(.custom(CustomFonts.MontserratBold.name, size: 14))
                .foregroundStyle(CustomColor.getColor(named: .white_FFFFFF))
                .frame(width: 370, height: 44)
                .background(CustomColor.getColor(named: .red_ED1C24))
                .cornerRadius(5)
                .padding(.top, 5)
            }
            .padding()
            .scrollIndicators(.hidden)
        }
        .sheet(isPresented: $showGenderPicker) {
            GenderPicker(selectedGender: $selectedGender, showPicker: $showGenderPicker)
        }
    }
}

struct GenderPicker: View {
    @Binding var selectedGender: Gender
    @Binding var showPicker: Bool
    
    var body: some View {
        NavigationView {
            List(genderNames) { gender in
                Button(action: {
                    selectedGender = gender
                    showPicker = false
                }) {
                    HStack {
                        Text(gender.type)
//                        Spacer()
//                        Text(selectedGender.code)
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



#Preview {
    LoginCompleteProfile(firstName: "", lastName: "")
}

struct FloatingTextField: View {
    
    let placeholderText: String
    @State private var text: String = ""
    
    let animation: Animation = .spring(response: 0.1, dampingFraction: 0.6)
    
    @State private var placeHolderOffset: CGFloat
    @State private var scaleEffectValue: CGFloat
    
    private var onTextAction: ((_ oldValue: String, _ newValue: String) -> ())?
    
    init(placeholderText: String, placeHolderOffset: CGFloat = 0, scaleEffectValue: CGFloat = 1, onTextAction: ((_: String, _: String) -> Void)? = nil) {
        self.placeholderText = placeholderText
        self.placeHolderOffset = placeHolderOffset
        self.scaleEffectValue = scaleEffectValue
        self.onTextAction = onTextAction
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeholderText)
                .padding()
                .foregroundStyle($text.wrappedValue.isEmpty ? CustomColor.getColor(named: .grey_light_BDBDBD) : CustomColor.getColor(named: .grey_light_BDBDBD))
                .font($text.wrappedValue.isEmpty ? .custom(CustomFonts.MontserratMedium.name, size: 16) : .custom(CustomFonts.MontserratRegular.name, size: 20) )
                .offset(y: placeHolderOffset)
                .scaleEffect(scaleEffectValue, anchor: .leading)
            
            TextField("", text: $text)
                .padding(.leading)
                .font(.custom(CustomFonts.MontserratMedium.name, size: 16))
                .frame(height: 58)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(CustomColor.getColor(named: .grey_light_BDBDBD), lineWidth: 1)
                )
                .onChange(of: text) { oldValue, newValue in
                    withAnimation(animation) {
                        placeHolderOffset = $text.wrappedValue.isEmpty ? 0 : -25
                        scaleEffectValue = $text.wrappedValue.isEmpty ? 1 : 0.75
                    }
                    
                    onTextAction?(oldValue, newValue)
                }
        }
    }
}


extension FloatingTextField {
    
    public func onTextChange(_ onTextAction: @escaping ((_ oldValue: String, _ newValue: String) -> ())) -> Self {
        
        var view = self
        view.onTextAction = onTextAction
        return view
    }
}
