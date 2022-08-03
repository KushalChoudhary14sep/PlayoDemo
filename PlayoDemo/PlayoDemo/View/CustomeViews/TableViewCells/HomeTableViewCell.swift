//
//  HomeTableViewCell.swift
//  PlayoDemo
//
//  Created by Kushal Choudhary on 03/08/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    private func setupUI() {
        newsTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        newsAuthorLabel.font = UIFont.systemFont(ofSize: 12)
        newsDescriptionLabel.font = UIFont.systemFont(ofSize: 10)
    }
    
    private func activateIndicator() {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    private func deActivateIndicator() {
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
    }
    
    func setData(data: Article?) {
        self.activateIndicator()
        ImageDownloder.loadImageFromURL(url: data?.urlToImage ?? "", imageView: self.newsImageView)
        self.newsTitleLabel.text = data?.title ?? ""
        self.newsAuthorLabel.text = data?.author ?? ""
        self.newsDescriptionLabel.text = data?.articleDescription ?? ""
        self.activityIndicator.stopAnimating()
        self.deActivateIndicator()
    }
    
}
