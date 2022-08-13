//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Artur Korol on 02.08.2022.
//

import SwiftUI

struct SettingsRowView: View {
    //MARK: - Properties
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    //MARK: - Body
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            HStack{
                Text(name)
                    .foregroundColor(.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                } else if linkLabel != nil && linkDestination != nil {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

//MARK: - Preview
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "Artur")
                .previewLayout(.sizeThatFits)
            .padding()
            SettingsRowView(name: "Developer", content: "Artur")
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
