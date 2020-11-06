//
//  ImageViewExtension.swift
//  News
//
//  Created by admin on 27/10/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import Foundation
import UIKit

public extension UIImageView {

 func imageFromServerURL(urlString: String) {
    URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
        
        if error != nil {
            print(error ?? "Error")
            return
        }
        DispatchQueue.main.async(execute: { () -> Void in
            let image = UIImage(data: data!)
            self.image = image
        })
        
    }).resume()
}}
