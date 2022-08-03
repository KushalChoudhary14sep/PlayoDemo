//
//  HomeViewModel.swift
//  PlayoDemo
//
//  Created by Kushal Choudhary on 03/08/22.
//

import Foundation
import UIKit

protocol HomeDataFetchedDelegate: AnyObject {
    func success()
    func error(message: String)
}

class HomeViewModel: NSObject {
    weak var view: HomeView? {
        didSet {
            self.fetchData()
        }
    }
    weak var dataFetchDelegate: HomeDataFetchedDelegate?
    
    private func fetchData() {
        NewsRestManager.shared.getNews { result in
            switch result {
            case .success(let response):
                if response.status == "ok" {
                    self.view?.newsData = response
                    self.dataFetchDelegate?.success()
                } else {
                    self.dataFetchDelegate?.error(message: response.status)
                }
            case .failure(let error):
                self.dataFetchDelegate?.error(message: error.localizedDescription)
            }
        }
    }
}

extension HomeViewModel: FetchHomeDataDelegate {
    func refreshData() {
        self.fetchData()
    }
}
