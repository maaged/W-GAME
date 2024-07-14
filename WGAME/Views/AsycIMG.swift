//
//  AsycIMG.swift
//  WGAME
//
//  Created by Maged on 14/07/2024.
//

import SwiftUI



struct AsycIMG: View {
    @State var url: String
    var body: some View {
        
        
        
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()//Added to use frame modifier
                .cornerRadius(8)
                .shadow(radius: 10)
        } placeholder: {
            ProgressView()
        }
        
    }
}


struct SwiftUIViewww_Previews: PreviewProvider {
    static var previews: some View {
        AsycIMG(url: "")
    }
}
