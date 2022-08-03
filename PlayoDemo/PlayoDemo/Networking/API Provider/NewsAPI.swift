//
//  NewsAPI.swift
//  PlayoDemo
//
//  Created by Kushal Choudhary on 03/08/22.
//

import Foundation
import Moya

enum NewsAPI {
    case getNews
}

extension NewsAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://newsapi.org/")!
    }
    
    var path: String {
        return "v2/top-headlines"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self{
        case .getNews:
            return .requestParameters(parameters: ["sources" : "techcrunch", "apiKey" : "14b9e1d1988a461fad88d9b502fa19cb"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
