//
//  ViewController.swift
//  PlayoDemo
//
//  Created by Kushal Choudhary on 03/08/22.
//

import Foundation
import UIKit

protocol HomeView: AnyObject {
    var tableView: UITableView! { get set }
    var newsData: NewsResponse? { get set }
}

class HomeViewController: UIViewController, HomeView {
    @IBOutlet weak var tableView: UITableView!
    private var homeUIController: HomeUIController?
    private var homeViewModel: HomeViewModel?
    var newsData: NewsResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeUIController = HomeUIController()
        self.homeUIController?.view = self
        self.homeViewModel = HomeViewModel()
        self.homeViewModel?.view = self
        self.homeViewModel?.dataFetchDelegate = homeUIController
        self.homeUIController?.delegate = homeViewModel
    }
}


