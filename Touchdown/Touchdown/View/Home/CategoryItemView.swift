//
//  CategoryItemView.swift
//  Touchdown
//
//  Created by Artur Korol on 16.08.2022.
//

import SwiftUI

struct CategoryItemView: View {
    //MARK: - Properties
    let category: Category
    
    //MARK: - Body
    var body: some View {
        Button {
            
        } label: {
            HStack(alignment: .center, spacing: 6) {
                Image(category.image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.gray)
                Text(category.name.uppercased())
                    .foregroundColor(.gray)
                    .fontWeight(.light)
                Spacer()
            }
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray ,lineWidth: 1)
            )
        }
    }
}

//MARK: - Preview
struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(category: categories[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.mainBackground)
    }
}
