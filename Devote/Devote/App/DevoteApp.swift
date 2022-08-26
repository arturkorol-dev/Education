//
//  DevoteApp.swift
//  Devote
//
//  Created by Artur Korol on 18.08.2022.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared
    
    @AppStorage("isDarkMode") var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
