//
//  slideView.swift
//  WGAME
//
//  Created by Maged on 13/07/2024.
//

import SwiftUI

struct slideView: View {
    var product:ProductElement
    @State private var favorites = Favorites()
    @State  var cat : String = "all"

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                VStack(alignment: .leading){
                    Text(product.title)
                        .font(.system(size: 15.5))
                        .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .frame(width: .infinity, height: .infinity, alignment: .leading)

                 
                }

                
            }

            .padding()
            
            Text(product.description)
                .foregroundColor(.white)
                .lineLimit(4)
                .padding()
                .font(.system(size: 15.5))

            

            
        }
        .background(Color.black, in: RoundedRectangle(cornerRadius: 12))
        .opacity(0.8)
        //MARK: - PRODUCT IMAGE
        .fullBackground(imageName: product.thumbnail)
        // END PRODUCT IMAGE
    }
}

//struct slideView_Previews: PreviewProvider {
//    static var previews: some View {
//        slideView(product: Home().SliderProducts.first!)
//    }
//}
