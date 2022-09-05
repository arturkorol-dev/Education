//
//  View+Ext.swift
//  Authentication
//
//  Created by Artur Korol on 04.09.2022.
//

import SwiftUI

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}
