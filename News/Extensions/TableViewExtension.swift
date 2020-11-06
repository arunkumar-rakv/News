//
//  TableViewExtension.swift
//  News
//
//  Created by admin on 29/10/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func setBgView(message: String) {
        let msgLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        msgLabel.textAlignment = .center
        msgLabel.textColor = UIColor.black
        msgLabel.text = message
        
        self.backgroundView = UIView()
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
