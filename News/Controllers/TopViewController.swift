//
//  TopViewController.swift
//  News
//
//  Created by admin on 03/11/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import XLPagerTabStrip

class TopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, IndicatorInfoProvider {

    @IBOutlet weak var tableView: UITableView!
    
    private var articles = [NewsArticle]()
    private let activityView = UIActivityIndicatorView(style: .large)
    private let refreshControl = UIRefreshControl()
    private var loadingMore: Bool = true
    private var pageNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        activityView.center = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        
        self.view.addSubview(activityView)
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        fetchData()
    }
    
    @objc private func refreshData(_ sender: Any) {
        fetchData()
    }
    
    func fetchData() {
        self.activityView.startAnimating()
        Services.fetchTopHeadlines { result in
            switch result {
            case .success(let articles):
                self.articles = articles.articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.loadingMore = false
                    self.refreshControl.endRefreshing()
                    self.activityView.stopAnimating()
                }
            case .failure(let error):
                self.activityView.stopAnimating()
                self.refreshControl.endRefreshing()
                //let view = UIView()
                //view.frame = self.view.bounds
                let errorLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
                errorLabel.textAlignment = .center
                errorLabel.textColor = UIColor.black
                errorLabel.text = "Error! Please try again."
                
                self.view.addSubview(errorLabel)
                
                print (error.localizedDescription)
            }
        }
    }
    
    func fetchMoreData() {
        self.activityView.startAnimating()
        Services.fetchTopHeadlines(parameters: ["page": String(self.pageNumber)]) { result in
            switch result {
            case .success(let articles):
                self.articles += articles.articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.loadingMore = false
                    self.refreshControl.endRefreshing()
                    self.activityView.stopAnimating()
                }
            case .failure(let error):
                self.activityView.stopAnimating()
                self.refreshControl.endRefreshing()
                //let view = UIView()
                //view.frame = self.view.bounds
                let errorLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
                errorLabel.textAlignment = .center
                errorLabel.textColor = UIColor.black
                errorLabel.text = "Error! Please try again."
                
                self.view.addSubview(errorLabel)
                
                print (error.localizedDescription)
            }
        }
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Top")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.articles.count == 0 {
            tableView.setBgView(message: "No News")
        } else {
            tableView.restore()
        }
        return self.articles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("No instance of ArticleCell")
        }
        
        let article = self.articles[indexPath.row]
        cell.articleLabel.text = article.title
        //cell.articleImage?.imageFromServerURL(urlString: article.urlToImage ?? "https://via.placeholder.com/150")
        cell.articleImage?.sd_setImage(with: URL(string: article.urlToImage ?? "https://via.placeholder.com/150"), placeholderImage: UIImage(named: "placeholder.png"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastData = self.articles.count - 1;
        if !loadingMore && indexPath.row == lastData {
            loadingMore = true
            pageNumber += 1
            fetchMoreData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let indexPath = self.tableView.indexPathForSelectedRow
    
         let article = self.articles[indexPath!.row]
         let individualViewController = segue.destination as! IndividualViewController
         individualViewController.titleText = article.title
         individualViewController.descText = article.description
         individualViewController.imageURL = article.urlToImage
     }

}
