//
//  ProfileView.swift
//  PBKSSwiftUI
//
//  Created by Jaideep Singh on 14/05/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var firstName: String = "John"
    @State private var lastName: String = "Doe"
    @State private var gender: String = ""
    let mobileNumber = "8023456789"
    let genders = ["Male", "Female", "Other"]
    @State private var showEditProfile = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                       
                        ZStack(alignment: .top) {
                            Image("profile_bg_image")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 320)

                            VStack(spacing: 0) {

                                Image("avatarLogo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                    .shadow(radius: 4)
                                    .padding(.top, 10)
                                Spacer().frame(height: 10)
                                HStack(spacing: 0) {
                                    Text("Harpreet ")
                                        .font(.system(size: 28, weight: .regular))
                                        .foregroundColor(.white)
                                    Text("Singh")
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                Spacer().frame(height: 8)
                                Text("Harpreet has following PBKS since Nov 10, 2023.\nHarpreet's favourite player is Shikhar Dhawan.")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 16)
                            }
                            .padding(.top, 10)
                        }
                        .frame(height: 320)
                        
                        Image("profile_jersey")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 300)
                            .overlay(
                                VStack(spacing: 0) {
                                    Spacer().frame(height: 38)
                                   
                                    Text("619")
                                        .font(.custom(CustomFonts.MontserratBold.rawValue, size: 48))
                                        .foregroundColor(CustomColor.getColor(named: .yellow_FFDEAD))
                                        .padding(.top,40)
                                    Text("Harpreet")
                                        .font(.custom(CustomFonts.MontserratBold.rawValue, size: 24))                                    .foregroundColor(CustomColor.getColor(named: .yellow_FFDEAD))
                                    Spacer()
                                }
                            )
                            .padding(.top, -100)
                            .padding(.bottom, 10)
                        
                        // Form
                        VStack(spacing: 18) {
                            ProfileField(label: "Mobile Number", value: mobileNumber)
                            ProfileField(label: "First Name", value: $firstName)
                            ProfileField(label: "Last Name", value: $lastName)
    //                        GenderPickerField(gender: $gender, genders: genders)
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 8)
                        
                        // Update Button
                        NavigationLink(destination: EditProfileView()) {
                            Text("Update Your Profile")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(red: 0.93, green: 0.11, blue: 0.14))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 18)
                    }
                }
            }
        }
    }
}

// MARK: - ProfileField
struct ProfileField: View {
    var label: String
    @Binding var value: String
   

    init(label: String, value: Binding<String>) {
        self.label = label
        self._value = value
        
    }

    // For non-editable fields
    init(label: String, value: String) {
        self.label = label
        self._value = .constant(value)
        
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.system(size: 13))
                .padding(.horizontal, 15)
                .padding(.top)
                .foregroundColor(.gray)
           
            Text(value)
                .font(.system(size: 18))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
                .padding(.horizontal, 15)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .cornerRadius(10)
    }
    
}

// MARK: - GenderPickerField
struct GenderPickerField: View {
    @Binding var gender: String
    let genders: [String]

    var body: some View {
        Menu {
            ForEach(genders, id: \ .self) { genderOption in
                Button(genderOption) {
                    gender = genderOption
                }
            }
        } label: {
            HStack {
                Text(gender.isEmpty ? "Gender*" : gender)
                    .foregroundColor(gender.isEmpty ? .gray : .black)
                    .font(.system(size: 18))
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
        }
    }
}

#Preview {
    ProfileView()
}
