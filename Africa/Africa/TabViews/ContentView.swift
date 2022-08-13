//
//  ContentView.swift
//  Africa
//
//  Created by Artur Korol on 03.08.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    private let animals: [Animal] = Bundle.main.decode("animals")
    private let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive = false
//    var gridLayout = Array(repeating: GridItem(.flexible()), count: 2)
    @State var gridLayout = [ GridItem(.flexible()) ]
    @State var gridCount = 1
    @State var gridIcon = "square.grid.2x2"
    
    //MARK: - Methods
    private func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridCount % 3 + 1)
        gridCount = gridLayout.count
        
        //Change image
        switch gridCount {
        case 1:
            gridIcon = "square.grid.2x2"
        case 2:
            gridIcon = "square.grid.3x2"
        case 3:
            gridIcon = "rectangle.grid.1x2"
        default:
            gridIcon = "square.grid.2x2"
        }
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animals: animal)
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItem(animal: animal)
                                }

                            }
                        })
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        
                        //List
                        Button {
                            isGridViewActive = false
                            haptic.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        //Grid
                        Button {
                            isGridViewActive = true
                            haptic.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: gridIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
