//
//  ContentView.swift
//  Devote
//
//  Created by Artur Korol on 18.08.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK: - Property
    @State var task = ""
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    //MARK: - Fetching data
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
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
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack(spacing: 16) {
                        TextField("New task", text: $task)
                            .padding()
                            .background(
                                Color(UIColor.systemGray6)
                            )
                            .cornerRadius(10)
                        
                        Button {
                            addItem()
                            self.task.removeAll()
                            self.hideKeyboard()
                        } label: {
                            Text("Save")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    isButtonDisabled ? Color.gray : Color.pink
                                )
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .disabled(isButtonDisabled)
                    }
                    .padding()
                    
                    
                    List {
                        ForEach(items) { item in
                            NavigationLink {
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(item.task ?? "")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text(item.timestamp!, formatter: itemFormatter)
                                        .foregroundColor(.gray)
                                        .font(.footnote)
                                }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                }
            }
            .background(
                BackgroundImageView()
            )
            .background(
                backgroundGradient
                    .edgesIgnoringSafeArea(.all)
            )
            .onAppear(perform: {
                UITableView.appearance().backgroundColor = .clear
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .navigationTitle("Daily tasks")
        }
        .navigationViewStyle(.stack)
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        
    }
}
