import SwiftUI

struct DeleteAccountPopup: View {
    // Callback closures for button actions
    var onCancel: (() -> Void)? = nil
    var onDelete: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing: 0) {
                // Icon area
                ZStack {
                   Image("delete")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                .padding(.top, 24)
                
                // Title
                Text("Delete your Punjab Kings Account")
                   .font(.custom(CustomFonts.MontserratBold.rawValue, size: 20))
                   .foregroundColor(CustomColor.getColor(named: .red_ED1C24))
                    .multilineTextAlignment(.center)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                
                // Subtitle
                Text("Please read the below carefully.")
                    .font(Font.custom("Montserrat-Medium", size: 12))
                    .foregroundColor(CustomColor.getColor(named: .black_212121))
                    .multilineTextAlignment(.center)
                    .padding(.top, 4)
                    .padding(.horizontal, 24)
                
                // Description
                Text("You're trying to delete your Punjab Kings Account. You can cancel this request within 30 days from your profile. After 30 days, all your account data will be deleted.")
                    .font(Font.custom("Montserrat-Regular", size: 12))
                    .foregroundColor(CustomColor.getColor(named: .grey_616161))
                    .multilineTextAlignment(.center)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                
                // Buttons
                HStack(spacing: 10) {
                    Button(action: { onCancel?() }) {
                        Text("Cancel")
                            .font(Font.custom("Montserrat-Bold", size: 14))
                            .foregroundColor(CustomColor.getColor(named: .black_212121))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(CustomColor.getColor(named: .grey_616161))
                            )
                            .cornerRadius(5)
                    }
                    Button(action: { onDelete?() }) {
                        Text("Delete")
                            .font(Font.custom("Montserrat-Bold", size: 14))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            
                            .background(CustomColor.getColor(named: .red_ED1C24))
                          
                            .cornerRadius(5)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
                .padding(.bottom, 24)
            }
            
            
            .background(
                Color.white
               
            )
            .cornerRadius(10)
            .frame(maxWidth: 345)
            .shadow(radius: 24)
        }
    }
}

#Preview {
    DeleteAccountPopup()
} 
