//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Artur Korol on 20.08.2022.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

