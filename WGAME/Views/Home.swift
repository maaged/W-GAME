//
//  Home.swift
//  WGAME
//
//  Created by Maged on 13/07/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 8) {
                //MARK - APP BAR
                HStack {
                    //MARK: DRAWER MENU
                    Button {
                        
                    } label: {
                        Image("wave")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                    } // END DRAWER MENU
                    
                    Spacer()
                    
                    
                }
                .foregroundColor(.black)
                HStack {
                    //MARK: DRAWER MENU
                    Button {
                        
                    } label: {
                        Text("Hello, Mohamed")
                    } // END DRAWER MENU
                    
                    Spacer()
                    
                    //MARK: SEARCH ICON
                    Button {
                        
                    } label: {
                        Image("gamer")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                    } // END AVATAR ICON
                    
                    
                }
                .foregroundColor(.black)
                
                // END APP BAR
                HStack {
                    Text("Explore \nGames Giveaways")
                        .font(.title.bold())
                    
                    Spacer()
                    
                } // END BODY TOP
            } .padding()
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
