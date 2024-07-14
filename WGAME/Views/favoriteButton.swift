//
//  favoriteButton.swift
//  WGAME
//
//  Created by Maged on 14/07/2024.
//

import SwiftUI

struct favoriteButton: View {
    @State private var favorites = Favorites()
    @State private var isFavorited = false
    var product:ProductElement

    var body: some View {
           Button {
               isFavorited.toggle()
              
               
               if favorites.contains(product) {
                   //If favorites contains a product, we are trying to un-favorite and remove it
                   favorites.remove(product)
               } else {
                   favorites.add(product)
               }
              
           } label: {
               ZStack {
                   if isFavorited == false {
                       Capsule()
                           .frame(width: 50, height: 50)
                           .tint(.clear)

                   
                   } else {
                       Capsule()
                           .frame(width: 50, height: 50)
                           .tint(.clear)

                           
                   }
                   
                   HStack {

                       Image(systemName: favorites.contains(product) ? "heart.fill" : "heart")
                           .foregroundColor(favorites.contains(product) ? .red : .white)
                           
                   }
               }
           }
           .padding(.vertical)
       }
}

struct favoriteButton_Previews: PreviewProvider {
    static var previews: some View {

        favoriteButton(product: ProductElement(id: 0, title: "", worth: "", thumbnail: "", image: "", description: "", instructions: "", openGiveawayURL: "", publishedDate: "", type: "", platforms: "", endDate: "", users: 0, status: "", gamerpowerURL: "", openGiveaway: "", isFav: true))
    }
}
