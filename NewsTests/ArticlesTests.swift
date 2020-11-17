//
//  ArticlesTests.swift
//  NewsTests
//
//  Created by admin on 09/11/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import XCTest
@testable import News

class ArticlesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testArticlesResponse() throws {
        guard
            let path = Bundle(for: type(of: self)).path(forResource: "Articles", ofType: "json") else { fatalError("Can't find file") }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let response = try JSONDecoder().decode(NewsArticles.self, from: data)
        
        XCTAssertEqual(response.totalResults, 5421)
        let article = response.articles.first
        XCTAssertEqual(article?.title, "PayPal to let you buy and sell cryptocurrencies in the US")
        XCTAssertEqual(article?.urlToImage, "https://techcrunch.com/wp-content/uploads/2020/07/GettyImages-887657568.jpg?w=600")
        XCTAssertEqual(article?.description, "PayPal has partnered with cryptocurrency company Paxos to launch a new service. PayPal users in the U.S. will soon be able to buy, hold and sell cryptocurrencies. More countries are coming soon. PayPal plans to support Bitcoin, Ethereum, Bitcoin Cash and Lite…")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
