//
//  IndividualViewController.swift
//  News
//
//  Created by admin on 22/10/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import UIKit

class IndividualViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var titleText: String?
    var imageURL: String?
    var descText: String?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
        imageView?.sd_setImage(with: URL(string: imageURL ?? "https://via.placeholder.com/150"), placeholderImage: UIImage(named: "placeholder.png"))
        descLabel.text = descText
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
