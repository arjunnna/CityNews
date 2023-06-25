//
//  APIManagerErrorsTests.swift
//  CityNewsTests
//
//  Created by Mallikarjuna on 25/06/2023.
//

import XCTest
@testable import CityNews

final class APIManagerErrorsTests: XCTestCase {

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

    /// This Method is used test API Manager errors
    func testAPIManagerErrors() {
        XCTestCase().isEqual(APIManagerErrors.noArticles.errorDescription == "No News Articles found. Please try again")
        XCTestCase().isEqual(APIManagerErrors.invalidURL.errorDescription == "Invalid Request URL. Please check your URL once and try again")
        XCTestCase().isEqual(APIManagerErrors.decodingError.errorDescription == "Data has invalid format. Please try again")
        XCTestCase().isEqual(APIManagerErrors.dataNil.errorDescription == "Empty data received. Please try again")
        XCTestCase().isEqual(APIManagerErrors.noInternetConnection.errorDescription == "Please Check Your Internet Connection and Try Again")
        XCTestCase().isEqual(APIManagerErrors.unknownError.errorDescription == "Error Occured while fetching the News Articles. Please try again")
        XCTestCase().isEqual(APIManagerErrors.error.errorDescription == "error")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
