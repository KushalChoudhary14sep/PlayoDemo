//
//  NewsDetailsWebViewController.swift
//  PlayoDemo
//
//  Created by Kushal Choudhary on 03/08/22.
//

import Foundation
import UIKit
import WebKit

class NewsDetailsWebViewController: UIViewController {
    private var webView: WKWebView?
    private var url: URL?
    private let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    init(withURL: String) {
        self.url = URL(string: withURL)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(NSLocalizedString("init(coder:) has not been implemented", comment: ""))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupActivityIndicator()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupWebView()
        self.setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.activityView.stopAnimating()
    }
    
    private func setupActivityIndicator() {
        self.activityView.color = UIColor.black
        self.activityView.center = self.view.center
        self.view.addSubview(activityView)
        self.activityView.startAnimating()
    }
    
    private func setupWebView() {
        self.webView = WKWebView()
        self.webView?.load(URLRequest(url: self.url ?? URL(fileURLWithPath: "")))
        self.webView?.frame = self.view.frame
        self.view.addSubview(webView ?? WKWebView())
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        let backButton = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .done, target: self, action: #selector(close))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func close(){
        self.dismiss(animated: true)
    }
    
}
