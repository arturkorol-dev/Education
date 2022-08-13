//
//  SettingsView.swift
//  Fructus
//
//  Created by Artur Korol on 02.08.2022.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Properties
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding = false
    
    //MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    GroupBox(content: {
                        Divider()
                            .padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                            
                            Text("Most fruits are naturally low in fat, sodium and calories. None hame cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                        
                    }, label: {
                        SettingsLabelView(title: "Fructus", image: "info.circle")
                    })
                    
                    GroupBox {
                        Divider()
                            .padding(.vertical, 4)
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding) {
                            Text(isOnboarding ? "Restarted".uppercased() : "Restart".uppercased())
                                .foregroundColor(isOnboarding ? .green : .secondary)
                                .fontWeight(.bold)
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                        
                    } label: {
                        SettingsLabelView(title: "Customization", image: "paintbrush")
                    }

                    
                    GroupBox {
                        SettingsRowView(name: "Developer", content: "Artur")
                        SettingsRowView(name: "Designer", content: "Robert Petras")
                        SettingsRowView(name: "Compatibility", content: "IOS 14")
                        SettingsRowView(name: "LinkedIn", linkLabel: "@arturkorol7", linkDestination: "www.linkedin.com/in/arturkorol7/")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    } label: {
                        SettingsLabelView(title: "Application", image: "apps.iphone")
                    }
                }
                .navigationBarTitle("Settings", displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "xmark")
                        })
                )
                .padding()
            }
        }
    }
}

//MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
