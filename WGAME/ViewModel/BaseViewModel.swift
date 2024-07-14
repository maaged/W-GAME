//
//  BaseViewModel.swift
//  WGAME
//
//  Created by Maged on 13/07/2024.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    
    // MARK: - DETAIL VIEW
    @Published var currentProduct: ProductElement?
    @Published var showDetail = false
}


