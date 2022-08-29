//
//  SettingsView.swift
//  Notes WatchKit Extension
//
//  Created by Artur Korol on 29.08.2022.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Properties
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var sliderValue: Float = 1.0
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            Slider(value: $sliderValue, in: 1...4, step: 1)
                .tint(.accentColor)
                .onChange(of: sliderValue) { newValue in
                    lineCount = Int(newValue)
                }
        }
    }
}

//MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
