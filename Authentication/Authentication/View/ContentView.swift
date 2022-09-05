//
//  ContentView.swift
//  Authentication
//
//  Created by Artur Korol on 04.09.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    //MARK: - Body
    
    var body: some View {
        ZStack {
            Image("background-3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    headerView()
                    emailView()
                    passwordView()
                    bottomView()
                    
                }
                .padding(20)
            }
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(
                        Color.white, lineWidth: 0.2
                    )
                    .background(
                        Color.secondaryBackground
                            .opacity(0.5)
                    )
                    .background(
                        VisualEffectBlur(blurStyle: .systemThinMaterialDark)
                    )
                    .shadow(color: Color.shadowColor.opacity(0.5),
                            radius: 60, x: 0, y: 30)
            )
            .cornerRadius(30)
            .padding(.horizontal)
        }
    }
    
    //MARK: - View
    
    @ViewBuilder private func headerView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sign up")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
            Text("Access to library of tutorials, apps and courses created by Artur Korol.")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
    }
    
    @ViewBuilder private func emailView() -> some View {
        HStack(spacing: 12) {
            Image(systemName: "envelope.open.fill")
                .foregroundColor(.white)
            TextField("Email", text: $email)
                .colorScheme(.dark)
                .foregroundColor(.white.opacity(0.7))
                .autocapitalization(.none)
                .textContentType(.emailAddress)
        }
        .frame(height: 52)
        .overlay (
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white, lineWidth: 1)
                .blendMode(.overlay)
        )
        .background(
            Color.secondaryBackground
                .cornerRadius(16)
                .opacity(0.8)
        )
    }
    
    @ViewBuilder private func passwordView() -> some View {
        HStack(spacing: 12) {
            Image(systemName: "key.fill")
                .foregroundColor(.white)
            SecureField("Password", text: $password)
                .colorScheme(.dark)
                .foregroundColor(.white.opacity(0.7))
                .autocapitalization(.none)
                .textContentType(.emailAddress)
        }
        .frame(height: 52)
        .overlay (
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white, lineWidth: 1)
                .blendMode(.overlay)
        )
        .background(
            Color.secondaryBackground
                .cornerRadius(16)
                .opacity(0.8)
        )
    }
    
    @ViewBuilder private func bottomView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            GradientButtonView(action: {
                print("S")
            })
            
            Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy.")
                .font(.footnote)
                .foregroundColor(.white.opacity(0.7))
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white.opacity(0.1))
            
            VStack(alignment: .leading, spacing: 16) {
                Button {
                    //TODO: Add action
                } label: {
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.7))
                        GradientTextView(text: "Sign In")
                            .font(.footnote.bold())
                    }
                }
            }
        }
    }
}

//MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
