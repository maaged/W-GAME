//
//  Product.swift
//  WGAME
//
//  Created by Maged on 13/07/2024.
//
import SwiftUI


class ProductElement:Identifiable, Codable {
   
    
 
    
    var id: Int
    var title, worth: String
    var thumbnail, image: String
    var description, instructions: String
    var openGiveawayURL: String
    var publishedDate: String
    var type: String
    var platforms, endDate: String
    var users: Int
    var status: String
    var gamerpowerURL, openGiveaway: String
    var isFav :Bool?

    enum CodingKeys: String, CodingKey {
        case id, title, worth, thumbnail, image, description, instructions
        case openGiveawayURL = "open_giveaway_url"
        case publishedDate = "published_date"
        case type, platforms ,isFav
        case endDate = "end_date"
        case users, status
        case gamerpowerURL = "gamerpower_url"
        case openGiveaway = "open_giveaway"
    }

    init(id: Int, title: String, worth: String, thumbnail: String, image: String, description: String, instructions: String, openGiveawayURL: String, publishedDate: String, type: String, platforms: String, endDate: String, users: Int, status: String, gamerpowerURL: String, openGiveaway: String,isFav:Bool) {
        self.isFav = isFav
        self.id = id
        self.title = title
        self.worth = worth
        self.thumbnail = thumbnail
        self.image = image
        self.description = description
        self.instructions = instructions
        self.openGiveawayURL = openGiveawayURL
        self.publishedDate = publishedDate
        self.type = type
        self.platforms = platforms
        self.endDate = endDate
        self.users = users
        self.status = status
        self.gamerpowerURL = gamerpowerURL
        self.openGiveaway = openGiveaway
    }
}




