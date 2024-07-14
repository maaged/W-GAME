//
//  AuthServices.swift
//  WGAME
//
//
//   Created by Maged on 13/07/2024.
//

import Foundation
import Moya

enum Services {
  
  // Home
  case Home
    case Platform(parameters : [String:Any])


}
extension Services : URLRequestBuilder {
  var path: String {
    switch self {
 
    case .Home :
      return EndPoints.Home.rawValue
    case .Platform:
        return EndPoints.Home.rawValue
    }
  }
  var method: Moya.Method {
    switch self {
    case .Home ,.Platform:
      return .get
    }
  }
  var sampleData: Data {
    return Data()
  }
  var task: Task {
    switch self {
  
    case .Platform(let param) :
        return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
    case .Home  :
      return .requestPlain

    }
  }
}
