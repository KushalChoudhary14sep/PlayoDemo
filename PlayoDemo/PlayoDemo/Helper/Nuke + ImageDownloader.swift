//
//  Nuke + ImageDownloader.swift
//  PlayoDemo
//
//  Created by Kushal Choudhary on 03/08/22.
//

import Foundation
import UIKit
import Nuke

class ImageDownloder {
    static func loadImageFromURL(url : String, imageView : UIImageView){
        var resizedImageProcessors: [ImageProcessing] {
          let imageSize = CGSize(width: 200, height: 200)
          return [ImageProcessors.Resize(size: imageSize, contentMode: .aspectFill)]
        }
        let options = ImageLoadingOptions(
          placeholder: UIImage(named: "defaultImage"),
          transition: .fadeIn(duration: 0.5)
        )
        let imageURL = URL(string: url)
        
        if let imageURL = imageURL {
            let request = ImageRequest(url: imageURL,processors: resizedImageProcessors)
            Nuke.loadImage(with: request, options: options, into: imageView)
        }
    }
}
