//
//  NewsTests.swift
//  NewsTests
//
//  Created by admin on 28/09/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import XCTest
@testable import News

class NewsTests: XCTestCase {
    
    var sut: URLSession!
    var homeVC: HomeViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = URLSession(configuration: .default)
        homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? HomeViewController
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func testEverythingValid() {
        testValidCall(apiRoute: Routes.everything)
    }
    
    func testEverythingInValid() {
        testInValidCall(apiRoute: Routes.everything)
    }
    
    func testTopHeadlinesValid() {
        testValidCall(apiRoute: Routes.topHeadlines)
    }
    
    func testTopHeadlinesInValid() {
        testInValidCall(apiRoute: Routes.topHeadlines)
    }

    func testValidCall(apiRoute: String) {
        let url = URL(string: apiRoute)
        let promise = expectation(description: "Request completed")
        var statusCode: Int?
        var responseError: Error?
        
        let dataTask = sut.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
            
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testInValidCall(apiRoute: String) {
        let url = URL(string: apiRoute)
        let promise = expectation(description: "Request completed")
        var statusCode: Int?
        var responseError: Error?
        
        let dataTask = sut.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
            
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 401)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
