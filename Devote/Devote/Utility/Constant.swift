//
//  Constant.swift
//  Devote
//
//  Created by Artur Korol on 19.08.2022.
//

import SwiftUI

//MARK: - Formatter
let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

//MARK: - UI
var backgroundGradient: LinearGradient {
    LinearGradient(colors: [Color.pink, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
}

//MARK: - UX
let feedback = UINotificationFeedbackGenerator()
