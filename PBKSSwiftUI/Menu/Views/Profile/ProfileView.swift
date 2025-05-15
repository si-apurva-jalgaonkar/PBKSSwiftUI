import SwiftUI

struct ProfileView: View {
    @State private var firstName: String = "John"
    @State private var lastName: String = "Doe"
    let mobileNumber = "8023456789"

    var body: some View {
        ZStack {
            Color(.systemGray6).ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // Curved background with avatar and info
                    ZStack(alignment: .top) {
                        Image("profile_bg_image")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 320)
                            .clipped()
                        VStack(spacing: 0) {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                Spacer()
                                Text("My Profile")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "gearshape")
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal)
                            .padding(.top, 10)
                            Spacer().frame(height: 18)
                            Image("avatar")
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
                    
                    // Jersey
                    Image("jersey")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 210)
                        .overlay(
                            VStack(spacing: 0) {
                                Spacer().frame(height: 38)
                                Text("BKT")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(.green)
                                Text("619")
                                    .font(.system(size: 44, weight: .bold))
                                    .foregroundColor(.white)
                                Text("Harpreet")
                                    .font(.system(size: 24, weight: .medium))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        )
                        .padding(.bottom, 10)
                    
                    // Form
                    VStack(spacing: 18) {
                        ProfileField(label: "Mobile Number", value: mobileNumber, isBold: true, editable: false)
                        ProfileField(label: "First Name", value: $firstName)
                        ProfileField(label: "Last Name", value: $lastName)
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 8)
                    
                    // Update Button
                    Button(action: {
                        // Update profile action
                    }) {
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

// MARK: - ProfileField
struct ProfileField: View {
    var label: String
    @Binding var value: String
    var isBold: Bool = false
    var editable: Bool = true

    init(label: String, value: Binding<String>, isBold: Bool = false, editable: Bool = true) {
        self.label = label
        self._value = value
        self.isBold = isBold
        self.editable = editable
    }

    // For non-editable fields
    init(label: String, value: String, isBold: Bool = false, editable: Bool = false) {
        self.label = label
        self._value = .constant(value)
        self.isBold = isBold
        self.editable = editable
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.system(size: 13))
                .foregroundColor(.gray)
            if editable {
                TextField(label, text: $value)
                    .font(.system(size: 18, weight: isBold ? .bold : .regular))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            } else {
                Text(value)
                    .font(.system(size: 18, weight: isBold ? .bold : .regular))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    ProfileView()
} 