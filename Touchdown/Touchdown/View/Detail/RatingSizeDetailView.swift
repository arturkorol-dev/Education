//
//  RatingSizeDetailView.swift
//  Touchdown
//
//  Created by Artur Korol on 17.08.2022.
//

import SwiftUI

struct RatingSizeDetailView: View {
    //MARK: - Properties
    let sizes = ["XS", "S", "M", "L", "XL"]
    
    //MARK: - Body
    var body: some View {
        HStack(alignment: .top, spacing: 3) {
            //Rating
            VStack(alignment: .leading, spacing: 3) {
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.lightGray)
                
                HStack(alignment: .center, spacing: 3) {
                    ForEach(1...5, id: \.self) { _ in
                        Button {
                            
                        } label: {
                            Image(systemName: "star.fill")
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(Color.lightGray.cornerRadius(5))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            
            Spacer()
            
            //Sizes
            VStack(alignment: .trailing, spacing: 3) {
                Text("Sizes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.lightGray)
                HStack(alignment: .center, spacing: 5) {
                    ForEach(sizes, id: \.self) { size in
                        Button {
                            
                        } label: {
                            Text(size)
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.lightGray)
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(Color.white.cornerRadius(5))
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.lightGray, lineWidth: 2)
                                )
                        }
                    }
                }
            }
        }
    }
}

//MARK: - Preview
struct RatingSizeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RatingSizeDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
