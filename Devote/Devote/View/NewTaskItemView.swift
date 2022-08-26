//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Artur Korol on 23.08.2022.
//

import SwiftUI

struct NewTaskItemView: View {
    //MARK: - Properties
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task = ""
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    //MARK: - Methods
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.id = UUID()
            newItem.completion = false
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            isShowing = false
        }
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                
                Button {
                    addItem()
                    self.task.removeAll()
                    self.hideKeyboard()
                } label: {
                    Text("Save")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            isButtonDisabled ? Color.blue : Color.pink
                        )
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(isButtonDisabled)
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
            )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        }
        .padding()
    }
}

//MARK: - Preview
struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(
                Color.gray
            )
    }
}
