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
    private func getDocumentDirectory() -> URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    private func save() {
        do {
            // 1. Convert the notes array to data JSONEncoder
            let data = try JSONEncoder().encode(notes)
            // 2. Create a new URL to save the file using the getDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            // 3. Write the data to given Data
            try data.write(to: url)
        } catch {
            print("Saving data has failed")
        }
    }
    
    private func load() {
        DispatchQueue.main.async {
            do {
                // 1. Get the notes URL path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                // 2. Create a new property for data
                let data = try Data(contentsOf: url)
                // 3. Decode data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print("Have any problem with given data")
            }
        }
    }
    
    private func delete(offSets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offSets)
            save()
        }
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
            
            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        HStack {
                            Capsule()
                                .frame(width: 4)
                            .foregroundColor(.accentColor)
                            Text(notes[i].text)
                                .lineLimit(1)
                                .padding(.leading, 5)
                        } //: HSTACK
                    } //: LOOP
                    .onDelete(perform: delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            } //: LIST
        } //: VSTACK
        .navigationTitle("Notes")
        .onAppear {
            load()
        }
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
