//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Artur Korol on 28.08.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @State private var notes = [Note]()
    @State private var text = ""
    
    //MARK: - Methods
    private func save() {
        dump(notes)
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add new note", text: $text)
                
                Button {
                    guard text.isEmpty == false else { return }
                    let newNote = Note(id: UUID(), text: text)
                    notes.append(newNote)
                    text.removeAll()
                    save()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(.plain)
                .foregroundColor(.accentColor)

            } //: HSTACK
            
            Spacer()
            
            Text("\(notes.count)")
        } //: VSTACK
        .navigationTitle("Notes")
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
