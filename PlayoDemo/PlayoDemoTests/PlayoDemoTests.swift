//
//  PlayoDemoTests.swift
//  PlayoDemoTests
//
//  Created by Kushal Choudhary on 03/08/22.
//

import XCTest
@testable import PlayoDemo

class PlayoDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        self.checkHomeDataFetched()
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
    
    func checkHomeDataFetched() {
        let expectation = XCTestExpectation(description: "Check for api")
        NewsRestManager.shared.getNews { result in
            switch result{
            case .success(let response):
                XCTAssertTrue(response.status == "ok")
                expectation.fulfill()
                debugPrint("GET API Succedded")
            case .failure(let error):
                XCTAssertNotNil(error)
                debugPrint("GET API Failed")
            }
        }
        wait(for: [expectation], timeout: 30)
    }


}
