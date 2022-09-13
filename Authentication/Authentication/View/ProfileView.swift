//
//  ProfileView.swift
//  Authentication
//
//  Created by Artur Korol on 06.09.2022.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    //MARK: - Properties
    
    @State private var purchaseTitle: String = "Purchase Lifetime Pro Plan"
    @State private var showLoader: Bool = false
    @Environment(\.dismiss) var presentationMode
    
    //MARK: - Body
    
    var body: some View {
        ZStack {
            Image("background-2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    headerView()
                    centerView()
                    bottomView()
                }
                .padding(16)
                
                buttonsView()
            }
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white.opacity(0.2))
                    .background(
                        Color.secondaryBackground.opacity(0.5)
                    )
                    .background(
                        VisualEffectBlur(blurStyle: .dark)
                    )
                    .shadow(color: .shadowColor.opacity(0.5), radius: 30, y: 30)
            )
            .cornerRadius(30)
            .padding(.horizontal)
            
            logOutView()
            
            loaderView()
        }
    }
    
    //MARK: - View
    
    @ViewBuilder
    private func headerView() -> some View {
        HStack(spacing: 16) {
//            ZStack {
//                Circle()
//                    .foregroundColor(.lavenderGradientColor)
//                    .frame(width: 66, height: 66, alignment: .center)
//                Image(systemName: "person.fill")
//                    .foregroundColor(.white)
//                    .font(.system(size: 24, weight: .medium, design: .rounded))
//            }
//            .frame(width: 66, height: 66, alignment: .center)
            GradientProfileImageView(profilePicture: UIImage(named: "Profile")!)
                        .frame(width: 66, height: 66, alignment: .center)
            
            VStack(alignment: .leading) {
                Text("Artur Korol")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                
                Text("View profile")
                    .foregroundColor(.white.opacity(0.7))
                    .font(.footnote)
            }
            Spacer()
            
            Button {
                print("Segue to settings")
            } label: {
                TextFieldIconView(iconName: "gearshape.fill", currentlyEditing: .constant(true))
            }
        }
    }
    
    @ViewBuilder
    private func centerView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white.opacity(0.1))
            Text("Independent IOS Developer")
                .foregroundColor(.white)
                .font(.title2.bold())
            Label("Awarded 3 certificates since September 2022", systemImage: "calendar")
                .foregroundColor(.white.opacity(0.7))
                .font(.footnote)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white.opacity(0.1))
        }
    }
    
    @ViewBuilder
    private func bottomView() -> some View {
        HStack(spacing: 16) {
            Image("Twitter")
                .resizable()
                .foregroundColor(.white.opacity(0.7))
                .frame(width: 24, height: 24)
            Image(systemName: "link")
                .foregroundColor(.white.opacity(0.7))
                .font(.system(size: 17, weight: .semibold, design: .rounded))
            Text("GitHub")
                .foregroundColor(.white.opacity(0.7))
                .font(.footnote)
        }
    }
    
    @ViewBuilder
    private func buttonsView() -> some View {
        VStack {
            GradientButtonView(title: purchaseTitle) {
                showLoader = true
            }
            
            Button {
                purchaseTitle = "Restore Successful"
            } label: {
                GradientTextView(text: "Restore Purchases")
                    .font(.footnote.bold())
            }
            .padding(.bottom)
            
        }
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    private func logOutView() -> some View {
        VStack {
            Spacer()
            
            Button {
               signOut()
            } label: {
                Image(systemName: "arrow.turn.up.forward.iphone.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 0, z: 1))
                    .background {
                        Circle()
                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                            .frame(width: 42, height: 42)
                            .overlay {
                                VisualEffectBlur(blurStyle: .dark)
                                    .cornerRadius(21)
                                    .frame(width: 42, height: 42)
                            }
                    }
            }
            .padding(.bottom, 64)
        }
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    private func loaderView() -> some View {
        ZStack {
            if showLoader {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.white)
                    .frame(width: 50, height: 50, alignment: .center)
                
                Color.black.opacity(0.6)
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            purchaseTitle = "Purchase Successful"
                            showLoader = false
                        }
                    }
            }
        }
    }
    
    private func signOut() {
        do {
            try Auth.auth().signOut()
            presentationMode.callAsFunction()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

//MARK: - Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
