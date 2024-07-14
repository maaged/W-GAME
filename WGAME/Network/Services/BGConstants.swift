//
//  BGConstants.swift
//  WGAME
//
//
//   Created by Maged on 13/07/2024.
//

import Foundation

struct BGConstants {
    
    
    // MARK: - Network response status
    
    static var success:Int {return 1}
    static var added:Int {return 202}
    static var failed:Int {return 0}
    static var created:Int {return 201}
    static var unprocessableEntity : Int {return 401}
    static var notActive : Int {return 405}
    static var unauthenticated : Int {return 403}
    static var notAcceptable : Int {return 422}
    static var notFound : Int {return 404}
    static var userType : Int {return 1}
        
    // MARK: - APIs Constants
    static var baseURL:String {return "https://www.gamerpower.com/api/giveaways"}
    static var profileImg:String {return "https://eramoerp.com/uploads/web_users/"}
    static var apiURL:String {return "https://www.gamerpower.com/api/giveaways"}
    
    static var imagesURL:String {return baseURL + "storage/"}
}
struct BGDecoder {
    
    static func decode<T: Codable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
