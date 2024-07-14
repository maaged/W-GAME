//
//  exView.swift
//  WGAME
//
//  Created by Maged on 13/07/2024.
//

import Foundation
import SwiftUI
public extension View {
    func fullBackground(imageName: String) -> some View {
   
        return background(
         AsycIMG(url: imageName)
             .padding(2)
             .opacity(0.8)
             .background(Color.clear, in: RoundedRectangle(cornerRadius: 14))

        )
    }
}
