//
//  CardView.swift
//  WGAME
//
//  Created by Maged on 13/07/2024.
//

import SwiftUI

struct CardView: View {
    var product:ProductElement
    var isFav:Bool
    @State  var cat : String = "all"

    //MARK: LIKED BUTTON
    @State private var favorites = Favorites()
    @State private var isFavorited = false
    
    
    
    var body: some View {
    
    VStack(spacing: 100) {
        HStack {
            VStack(alignment: .leading){
                Text(product.title)
                .font(.title.bold())
                .font(.system(size: 11))
                .foregroundColor(.white)
                .lineLimit(3)
                .frame(width: .infinity, height: .infinity, alignment: .leading)

                Text(product.platforms)
                .foregroundColor(.white)
                .lineLimit(1)
            }

            //MARK: LIKED BUTTON
            favoriteButton(product: product).onAppear {
                self.isFavorited = favorites.contains(product)    // << here !!
                }

            
        }

        .padding()
        
        Text(product.description)
            .foregroundColor(.white)
            .lineLimit(4)
            .padding(.top,60)
            .padding()

            
        

        
    }
    .frame(width: 370, height: 440, alignment: .center)
    .background(Color.black, in: RoundedRectangle(cornerRadius: 12))
    .opacity(0.8)
  
    //MARK: - PRODUCT IMAGE
        .fullBackground(imageName: product.thumbnail)
    // END PRODUCT IMAGE
}
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(product: ProductElement(id: 22, title: "sdasdsa", worth: "dd", thumbnail: "dd", image: "www", description: "eeeee", instructions: "ssqqw", openGiveawayURL: "wwww", publishedDate: "ddsf", type: ".dlc", platforms: "s", endDate: "s", users: 2, status: ".active", gamerpowerURL: "ssssqq", openGiveaway: "www", isFav: true), isFav: false)
    }
}
