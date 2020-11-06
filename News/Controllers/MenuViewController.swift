//
//  MenuViewController.swift
//  News
//
//  Created by admin on 28/09/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import UIKit

enum Menu: Int {
    case home
    case develop
    case document
}

class MenuViewController: UITableViewController {
    
    var menuPressedType: ((Menu) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menu = Menu(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menu)")
            self?.menuPressedType?(menu)
            
        }
        
    }
    
}
