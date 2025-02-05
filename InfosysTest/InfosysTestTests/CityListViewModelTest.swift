//
//  CityListViewModelTest.swift
//  InfosysTaskTests
//
//  Created by Macbook on 05/02/25.
//

import XCTest
@testable import InfosysTest

final class CityListViewModelTest: XCTestCase {

    var viewModel: CityListViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CityListViewModel()
    }
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    
    func testLoadCities() {
        viewModel.loadCities()
        XCTAssertFalse(viewModel.citySections.isEmpty, "Section shoulde not be empty after loading data from json file.")
        
    }
    
    func testToggleSection() {
        viewModel?.loadCities()
        guard let section = viewModel?.citySections.first else {return}
        
        viewModel?.toggleSection(section: section)
        XCTAssertTrue(viewModel.isExpandSection(section: section), "Section shoulde be expanded after toggling.")
        
        viewModel?.toggleSection(section: section)
        XCTAssertFalse(viewModel.isExpandSection(section: section), "Section shoulde be collapsed after toggle agian.")
    }
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
