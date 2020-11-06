//
//  ParentViewController.swift
//  News
//
//  Created by admin on 03/11/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ParentViewController: ButtonBarPagerTabStripViewController {
    
    let transiton = SlideInTransition()
    var topView: UIView?
    let purpleColor = UIColor(red: 0.13, green: 0.03, blue: 0.25, alpha: 1.0)
    
    override func viewDidLoad() {
        
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = purpleColor
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = self?.purpleColor
        }
        self.title = "Home"
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeChild")
        let child2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "topChild")
        return [child1, child2]
    }
    
    @IBAction func menuPressed(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.menuPressedType = { menu in
            self.transitionToNew(menu)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    func transitionToNew(_ menu: Menu) {
        let title = String(describing: menu).capitalized
        self.title = title
        
        topView?.removeFromSuperview()
        switch menu {
        /*case .home:
            let view = UITableView()
            view.delegate = self
            view.dataSource = self
            view.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleTableViewCell")
            self.view.addSubview(view)
            self.topView = view*/
        case .develop:
            let view = UIView()
            view.backgroundColor = .green
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        case .document:
            let view = UIView()
            view.backgroundColor = .red
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        default:
            break
        }
    }

}
