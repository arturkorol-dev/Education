//
//  SignInWithAppleButton.swift
//  Authentication
//
//  Created by Artur Korol on 07.09.2022.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        //Do nothing
    }
}
