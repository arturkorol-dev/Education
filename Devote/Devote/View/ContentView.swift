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
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State var task = ""
    @State private var showNewItemTask = false
    
    //MARK: - Fetching data
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    //MARK: - Methods
    
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
            //MARK: - MainView
            ZStack {
                VStack {
                    //MARK: - Header
                    HStack(spacing: 10) {
                        // Title
                        Text("Devote")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.heavy)
                            .padding(.leading, 4)
                        Spacer()
                        
                        // Edit button
                        EditButton()
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(.horizontal, 10)
                            .frame(minWidth: 70, minHeight: 24)
                            .background(
                                Capsule()
                                    .stroke(Color.white, lineWidth: 2)
                            )
                        // Appearance button
                        Button {
                            isDarkMode.toggle()
                        } label: {
                            Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .font(.system(.title, design: .rounded))
                        }

                    }
                    .padding()
                    .foregroundColor(.white)
                    
                    Spacer(minLength: 80)
                    
                    //MARK: - NewTaskButton
                    
                    Button {
                        showNewItemTask = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                        Text("New Task")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 20)
                    .background(
                        LinearGradient(colors: [.pink, .blue], startPoint: .leading, endPoint: .trailing)
                            .clipShape(Capsule())
                    )
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
                    
                    //MARK: - Tasks
                    List {
                        ForEach(items) { item in
                            ListRowItemView(item: item)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                }
                //MARK: - NewTaskItem
                if showNewItemTask {
                    BlankView()
                        .onTapGesture {
                            withAnimation {
                                showNewItemTask = false
                            }
                        }
                    NewTaskItemView(isShowing: $showNewItemTask)
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
            .navigationBarHidden(true)
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
