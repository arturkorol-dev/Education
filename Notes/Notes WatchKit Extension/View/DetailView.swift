//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Artur Korol on 28.08.2022.
//

import SwiftUI

struct DetailView: View {
    //MARK: - Properties
    let note: Note
    let index: Int
    let count: Int
    
    @State private var isCreditsPresented: Bool = false
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 5) {
            //Header
            HeaderView()
            
            Spacer()
            
            //Content
            ScrollView(.vertical, showsIndicators: false) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            //Footer
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                Spacer()
                Text("\(index + 1) / \(count)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented) {
                        CreditsView()
                    }
            }
            .foregroundColor(.secondary)
        } //: VSTACK
        .padding(5)
    }
}

//MARK: - Preview
struct DetailView_Previews: PreviewProvider {
    static var sampleData = Note(id: UUID(), text: "Hello World!")
    static var previews: some View {
        DetailView(note: sampleData, index: 2, count: 5)
    }
}
