//
//  HomeUIController.swift
//  PlayoDemo
//
//  Created by Kushal Choudhary on 03/08/22.
//

import Foundation
import UIKit

protocol FetchHomeDataDelegate: AnyObject {
    func refreshData()
}

class HomeUIController: NSObject {
    weak var view: HomeView? {
        didSet {
            setupTableView()
            setupRefreshControl()
        }
    }
    private let refreshControl = UIRefreshControl()
    weak var delegate: FetchHomeDataDelegate?
    
    private func setupTableView() {
        self.view?.tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        self.view?.tableView.delegate = self
        self.view?.tableView.dataSource = self
    }
    
    private func setupRefreshControl() {
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        self.refreshControl.tintColor = .black
        self.view?.tableView.addSubview(refreshControl)
    }
    
    @objc private func refresh() {
        self.refreshControl.beginRefreshing()
        self.delegate?.refreshData()
    }

    private func showAlert(title: String, message: String, comletion : (() -> Void)?)  {
        let vc = self.view as? UIViewController
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            comletion?()
        }))
        vc?.present(alert, animated: true, completion: nil)
    }
    
}

extension HomeUIController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.view?.newsData?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.view?.tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.setData(data: self.view?.newsData?.articles?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view?.tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeUIController: HomeDataFetchedDelegate {
    func success() {
        self.view?.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    func error(message: String) {
        self.showAlert(title: "Error", message: message, comletion: nil)
    }
}
