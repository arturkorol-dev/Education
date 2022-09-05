//
//  AuthenticationApp.swift
//  Authentication
//
//  Created by Artur Korol on 04.09.2022.
//

import SwiftUI

@main
struct AuthenticationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
