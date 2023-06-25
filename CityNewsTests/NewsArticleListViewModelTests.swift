//
//  NewsArticleListViewModelTests.swift
//  CityNewsTests
//
//  Created by Mallikarjuna on 25/06/2023.
//

import XCTest
@testable import CityNews

final class NewsArticleListViewModelTests: XCTestCase {

    var viewModel = NewsArticleListViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testNewsArticleListViewModel() {
        if let path = Bundle.main.path(forResource: "NewsArticlesList", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
                if let result = try? JSONDecoder().decode(NewsArticlesResponseModel.self, from: data) {
                    self.viewModel.updatedNewsArticleList(result.articles ?? [])
                    XCTestCase().isEqual(self.viewModel.numberOfRows() == 93)
                    XCTestCase().isEqual(self.viewModel.getNewsTitle(0) == "Enhance Your Photography Experience: Get Ready for These 8 Amazing iPhone Photo Features in iOS 17")
                    XCTestCase().isEqual(self.viewModel.getNewsAuthor(0) == "Frederick Nyame")
                    XCTestCase().isEqual(self.viewModel.getNewsSourceName(0) == "Gizchina.com")
                    XCTestCase().isEqual(self.viewModel.getUrlToImage(0) == "https://picsum.photos/seed/picsum/200/300")
                }
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
