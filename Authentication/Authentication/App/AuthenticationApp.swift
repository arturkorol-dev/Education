//
//  AuthenticationApp.swift
//  Authentication
//
//  Created by Artur Korol on 04.09.2022.
//

import SwiftUI
import FirebaseCore

@main
struct AuthenticationApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SignupView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
