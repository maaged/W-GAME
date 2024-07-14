//
//  Favorites.swift
//  WGAME
//
//  Created by Maged on 13/07/2024.
//

import SwiftUI

class Favorites : ObservableObject {
    // the actual resorts the user has favorited
    private var resorts: Set<String>

    // the key we're using to read/write in UserDefaults
    private let key = "Favorites"
     var Ids =  [String]()
    init() {
        // load our saved data
        let myarray = UserDefaults.standard.stringArray(forKey: "favoritesList") ?? [String]()

        // still here? Use an empty array
      
        resorts = []
        for item in myarray {
            if item != " " {resorts.insert(item)}
            
        }
        
        
    }

    // returns true if our set contains this resort
    func contains(_ resort: ProductElement) -> Bool {
        resorts.contains("\(resort.id)")
    }

    // adds the resort to our set and saves the change
    func add(_ resort: ProductElement) {
        resorts.insert("\(resort.id)")
        save()
    }

    // removes the resort from our set and saves the change
    func remove(_ resort: ProductElement) {
        resorts.remove("\(resort.id)")
        
        save()
    }

    func save() {
        // write out our data
//        print(resorts)
//        Ids.append("\(resorts.first?.description ?? "")")
        for item in resorts {
            Ids.append(item)
        }
        resorts.removeAll()
        
        Ids  = Ids.unique()
        UserDefaults.standard.set(Ids ,forKey: "favoritesList")
        Ids.removeAll()
        let myarray = UserDefaults.standard.stringArray(forKey: "favoritesList") ?? [String]()
        for item in myarray {
            if item != " " {resorts.insert(item)}
            
        }
        
        print(myarray)
    }
}
