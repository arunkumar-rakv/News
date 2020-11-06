//
//  HomeViewControllerExtension.swift
//  News
//
//  Created by admin on 27/10/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import Foundation
import UIKit

extension ParentViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}
