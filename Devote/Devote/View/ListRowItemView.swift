//
//  ListRowItemView.swift
//  Devote
//
//  Created by Artur Korol on 26.08.2022.
//

import SwiftUI

struct ListRowItemView: View {
    //MARK: - Properties
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var item: Item
    
    //MARK: - Body
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical, 12)
        }
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange) { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        }
    }
}
