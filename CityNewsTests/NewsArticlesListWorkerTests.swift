//
//  NewsArticlesListWorkerTests.swift
//  CityNewsTests
//
//  Created by Mallikarjuna on 25/06/2023.
//

import XCTest
@testable import CityNews

final class NewsArticlesListWorkerTests: XCTestCase {

    var apiManager = APIManagerMock()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNewsArticlesListWorker() {
        let isErrror = false
        let newsArticlesListWorker = NewsArticlesListWorker(apiManager: apiManager)
        newsArticlesListWorker.apiManager?.request(NewsArticlesTarget.getNewsArticles(pageId: "1", searchText: "iOS")) { (result: Envelope<NewsArticlesResponseModel>) in
            switch result {
            case .success(let response):
                if let newsArticles = response.articles {
                    print("newsArticles", newsArticles.count)
                    XCTestCase().isEqual(newsArticles.count == 93)
                    XCTAssertNotNil(response)
                }
            case .failure(_):
                XCTAssertTrue(isErrror)
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
