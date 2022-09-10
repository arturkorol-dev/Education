//
//  ContentView.swift
//  Authentication
//
//  Created by Artur Korol on 04.09.2022.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    //MARK: - Properties
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rotatingAngle: Double = 0.0
    @State private var editingEmailTextField: Bool = false
    @State private var editingPasswordTextField: Bool = false
    @State private var emailIconBounds: Bool = false
    @State private var passwordIconBounds: Bool = false
    @State private var showProfileView: Bool = false
    @State private var isSignIn: Bool = false
    @State private var fadeToggle: Bool = true
    
    @State private var showAlertView: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMassage: String = ""
    
    @State private var signInWithAppleObject = SignInWithAppleObject()
    
    private let haptic = UIImpactFeedbackGenerator()
    
    //MARK: - Body
    
    var body: some View {
        ZStack {
            Image(isSignIn ? "background-3" : "background-1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(fadeToggle ? 1.0 : 0.0)
            
            Color.secondaryBackground
                .edgesIgnoringSafeArea(.all)
                .opacity(fadeToggle ? 0.0 : 1.0)
            
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    headerView()
                    emailView()
                    passwordView()
                    bottomView()
                    
                }
                .padding(20)
            }
            .rotation3DEffect(
                Angle.degrees(rotatingAngle),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
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
            .rotation3DEffect(
                Angle.degrees(rotatingAngle),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .alert(isPresented: $showAlertView) {
                Alert(title: Text(alertTitle), message: Text(alertMassage), dismissButton: .cancel())
            }
        }
        .fullScreenCover(isPresented: $showProfileView) {
            ProfileView()
        }
    }
    
    //MARK: - View
    
    @ViewBuilder private func headerView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(isSignIn ? "Sign in" : "Sign up")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
            Text("Access to library of tutorials, apps and courses created by Artur Korol.")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
    }
    
    @ViewBuilder private func emailView() -> some View {
        HStack(spacing: 12) {
            TextFieldIconView(iconName: "envelope.open.fill", currentlyEditing: $editingEmailTextField)
                .scaleEffect(emailIconBounds ? 1.2 : 1.0)
            TextField("Email", text: $email) { isEditing in
                editingEmailTextField = isEditing
                editingPasswordTextField = false
                if isEditing {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                        emailIconBounds.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                            emailIconBounds.toggle()
                        }
                    }
                }
            }
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
            TextFieldIconView(iconName: "key.fill", currentlyEditing: $editingPasswordTextField)
                .scaleEffect(passwordIconBounds ? 1.2 : 1.0)
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
        .onTapGesture {
            editingPasswordTextField = true
            editingEmailTextField = false
            if editingPasswordTextField {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                    passwordIconBounds.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                        passwordIconBounds.toggle()
                    }
                }
            }
        }
    }
    
    @ViewBuilder private func bottomView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            GradientButtonView(title: isSignIn ? "Sign in" : "Create account") {
                self.authorise()
                self.haptic.impactOccurred()
            }
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        self.showProfileView.toggle()
                    }
                }
            }
            
            if !isSignIn {
                Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy.")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.7))
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.white.opacity(0.1))
            }
            Button {
                withAnimation(.easeInOut(duration: 0.35)) {
                    self.fadeToggle.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                        withAnimation(.easeInOut(duration: 0.35)) {
                            self.fadeToggle.toggle()
                        }
                    }
                }
                
                withAnimation(.easeInOut(duration: 0.7)) {
                    self.isSignIn.toggle()
                    self.haptic.impactOccurred()
                    self.rotatingAngle += 180.0
                }
            } label: {
                HStack(spacing: 4) {
                    Text(isSignIn ? "Don't have an account?" : "Already have an account?")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.7))
                    GradientTextView(text: isSignIn ? "Sign up" : "Sign in")
                        .font(.footnote.bold())
                }
            }
            
            if isSignIn {
                Button {
                    resetPassword()
                } label: {
                    HStack(spacing: 4) {
                        Text("Forgot password?")
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.7))
                        GradientTextView(text: "Reset Password")
                            .font(.footnote.bold())
                    }
                }
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.white.opacity(0.1))
                
                Button {
                    signInWithAppleObject.signInWithApple()
                } label: {
                    SignInWithAppleButton()
                        .frame(height: 50)
                        .cornerRadius(16)
                }
            }
        }
    }
    
    //MARK: - Methods
    
    private func authorise() {
        if !isSignIn {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                guard error == nil else {
                    self.alertTitle = "Uh-oh!"
                    self.alertMassage = error!.localizedDescription
                    self.showAlertView.toggle()
                    return
                }
            }
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                guard error == nil else {
                    self.alertTitle = "Uh-oh!"
                    self.alertMassage = error!.localizedDescription
                    self.showAlertView.toggle()
                    return
                }
            }
        }
    }
    
    private func resetPassword() {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            guard error == nil else {
                self.alertTitle = "Uh-oh!"
                self.alertMassage = error!.localizedDescription
                self.showAlertView.toggle()
                return
            }
            self.alertTitle = "Password reset email sent"
            self.alertMassage = "Check your inbox for an email to reset your password"
            self.showAlertView.toggle()
        }
    }
}

//MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
