//
//  EditProfileView.swift
//  PBKSSwiftUI
//
//  Created by Jaideep Singh on 14/05/25.
//

import SwiftUI

struct EditProfileView: View {
    @State private var mobileNumber: String = "8023456789"
    @State private var firstName: String = "Harpreet"
    @State private var lastName: String = "Singh"
    @State private var gender: String = "Male"
    @State private var email: String = ""
    @State private var dob: Date = Date()
    @State private var country: String = ""
    @State private var state: String = ""
    @State private var city: String = ""
    @State private var goToFavPlayer: Bool = false
    
    let genders = ["Male", "Female", "Other"]
    let countries = ["India", "USA", "UK"]
    let states = ["Punjab", "Delhi", "California"]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical,showsIndicators: false) {
                VStack(spacing: 0) {
                    // Header with curved background and logo
                    ZStack(alignment: .top) {
                        Image("updated_profile_jersey")
                            .resizable()
                            .frame(height: 202)
                        
                        VStack(spacing: 0) {
                            Image("pbsk_logo")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.top,35)
                            
                        }
                    }
                    .padding(.bottom, 8)
                    // Stepper
                    Image("steps_indicator_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(10)
                    // Title and Skip
                    HStack {
                        Text("Update Your Profile")
                            .font(.custom(CustomFonts.MontserratBold.rawValue, size: 20))
                            .foregroundColor(CustomColor.getColor(named: .red_ED1C24))
                            .padding(.top,5)
                        Spacer()
                        Button("Skip") {}
                            .font(.custom(CustomFonts.MontserratMedium.rawValue, size: 14))
                            .foregroundColor(CustomColor.getColor(named: .grey_616161))
                            .underline()
                            .padding(.top,5)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 8)
                    // Form
                    
                    VStack(spacing: 16) {
                        EditProfileField(label: "Mobile Number", value: $mobileNumber)
                        EditProfileField(label: "First Name *", value: $firstName)
                        EditProfileField(label: "Last Name *", value: $lastName)
                        DropdownField(label: "Gender *", selection: $gender, options: genders)
                        EditProfileField(label: "Email", value: $email)
                        DatePickerField(label: "Date of Birth", date: $dob)
                        DropdownField(label: "Country", selection: $country, options: countries)
                        DropdownField(label: "State", selection: $state, options: states)
                        EditProfileField(label: "City", value: $city)
                    }
                    .padding(.leading,10)
                    .padding(.trailing,10)
                    .padding(.top, 8)
                    // Submit Button
                    Button(action: {
                        goToFavPlayer = true
                    }) {
                        Text("SUBMIT")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.93, green: 0.11, blue: 0.14).opacity(0.5))
                            .cornerRadius(8)
                    }
                    .background(
                               NavigationLink(
                                   destination: ProfileFavPlayerView(),
                                   isActive: $goToFavPlayer,
                                   label: { EmptyView() }
                               )
                               .hidden()
                           )
                    
                    .padding(.leading,10)
                    .padding(.trailing,10)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                    
                }
                .background(Color(.systemGray6).ignoresSafeArea())
            }
        }
    }
}


// MARK: - EditProfileField
struct EditProfileField: View {
    var label: String
    @Binding var value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.custom(CustomFonts.MontserratRegular.rawValue, size: 12))
                .foregroundColor(CustomColor.getColor(named: .grey_616161))
                .padding(.horizontal, 15)
                .padding(.top, 8)

            TextField("", text: $value)
                .font(.custom(CustomFonts.MontserratBold.rawValue, size: 16))
                .foregroundColor(CustomColor.getColor(named: .black_212121))
                .padding(.horizontal, 15)
                .padding(.bottom, 8)
        }
        .background(Color(.systemGray6))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .cornerRadius(10)
    }
}



// MARK: - DropdownField
struct DropdownField: View {
    var label: String
    @Binding var selection: String
    let options: [String]

    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label + "*")
                .font(.custom(CustomFonts.MontserratRegular.rawValue, size: 12))
                .foregroundColor(CustomColor.getColor(named: .grey_616161))
                .padding(.horizontal, 10)

            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(selection.isEmpty ? "Select \(label)" : selection)
                        .font(.custom(CustomFonts.MontserratBold.rawValue, size: 16))
                        .foregroundColor(CustomColor.getColor(named: .black_212121))
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
            }

            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            selection = option
                            withAnimation {
                                isExpanded = false
                            }
                        }) {
                            Text(option)
                                .font(.custom(CustomFonts.MontserratRegular.rawValue, size: 16))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        .background(Color.white)
                        .overlay(
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 1)
                                .offset(y: 0),
                            alignment: .bottom
                        )
                    }
                }
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
        }
       // .padding(.horizontal, 10)
        .animation(.easeInOut(duration: 0.2), value: isExpanded)
    }
}

// MARK: - DatePickerField
struct DatePickerField: View {
    var label: String
    @Binding var date: Date
    @State private var showPicker = false
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.custom(CustomFonts.MontserratRegular.rawValue, size: 12))
                .foregroundColor(CustomColor.getColor(named: .grey_616161))
                .padding(.horizontal, 15)
                .padding(.top, 8)
            Button(action: { showPicker.toggle() }) {
                HStack {
                    Text(date, style: .date)
                        .font(.custom(CustomFonts.MontserratBold.rawValue, size: 16))
                        .foregroundColor(CustomColor.getColor(named: .black_212121))
                    Spacer()
                    Image(systemName: "calendar")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 15)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }
            .sheet(isPresented: $showPicker) {
                VStack {
                    DatePicker("Select Date", selection: $date, displayedComponents: .date)
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                    Button("Done") { showPicker = false }
                        .padding()
                }
                .presentationDetents([.medium])
            }
        }
        .background(Color(.systemGray6))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .cornerRadius(10)
    }
}

#Preview {
    EditProfileView()
}
