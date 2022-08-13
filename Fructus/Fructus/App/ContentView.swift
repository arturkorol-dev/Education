//
//  ContentView.swift
//  Fructus
//
//  Created by Artur Korol on 28.07.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    private var fruit = fruitsData
    @State private var isShowingSettings = false
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List(fruit.shuffled()) { item in
                NavigationLink(destination: {
                    FruitDetailView(fruit: item)
                }, label: {
                    FruitRowView(fruit: item)
                        .padding(.vertical, 4)
                })
            }
            .listStyle(.plain)
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingSettings = true
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                    })
                    .sheet(isPresented: $isShowingSettings, content: {
                        SettingsView()
                    })
            )
        }
        .navigationViewStyle(.stack)
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
