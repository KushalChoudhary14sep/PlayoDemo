//
//  NewsRestManager.swift
//  PlayoDemo
//
//  Created by Kushal Choudhary on 03/08/22.
//

import Foundation
import Moya

class NewsRestManager: NSObject {
    static var shared = NewsRestManager()
    private var apiProvider = MoyaProvider<NewsAPI>()
    
    public func getNews(handler: ((Result<NewsResponse,Error>)->())?) {
        self.apiProvider.request(.getNews) { result in
            switch result {
            case .success(let resposne):
                do {
                    let decodedData = try JSONDecoder().decode(NewsResponse.self, from: resposne.data)
                    handler?(.success(decodedData))
                } catch let error {
                    handler?(.failure(error))
                }
            case .failure(let error):
                handler?(.failure(error))
            }
        }
    }
}
