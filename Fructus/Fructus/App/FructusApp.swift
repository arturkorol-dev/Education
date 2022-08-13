//
//  FructusApp.swift
//  Fructus
//
//  Created by Artur Korol on 28.07.2022.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
