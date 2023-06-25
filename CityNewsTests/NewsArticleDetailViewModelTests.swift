//
//  NewsArticleDetailViewModelTests.swift
//  CityNewsTests
//
//  Created by Mallikarjuna on 25/06/2023.
//

import XCTest
@testable import CityNews

final class NewsArticleDetailViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNewsArticleDetailViewModel() {
        if let path = Bundle.main.path(forResource: "NewsArticlesList", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
                if let result = try? JSONDecoder().decode(NewsArticlesResponseModel.self, from: data) {
                    if let articles = result.articles {
                        let viewModel = NewsArticleDetailViewModel(articles[0])
                        XCTestCase().isEqual(viewModel.getNewsTitle() == "Enhance Your Photography Experience: Get Ready for These 8 Amazing iPhone Photo Features in iOS 17")
                        XCTestCase().isEqual(viewModel.getNewsAuthor() == "Frederick Nyame")
                        XCTestCase().isEqual(viewModel.getNewsSourceName() == "Gizchina.com")
                        XCTestCase().isEqual(viewModel.getUrlToImage() == "https://picsum.photos/seed/picsum/200/300")
                        XCTestCase().isEqual(viewModel.getArticleDescription() == "Bloomberg delivers business and markets news, data, analysis, and video to the world, featuring stories from Businessweek and Bloomberg News.")
                        XCTestCase().isEqual(viewModel.getArticlePublishDate() == "Published Time: 2023-06-23 17:43")
                    }
                }
            }
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
