//
//  Created by Peter Combee on 21/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class LocationsViewControllerTest: XCTestCase {
    
    func test_viewIsSetCorrectly() {
        let sut = LocationsViewController()
        sut.loadViewIfNeeded()
        XCTAssertTrue(
            sut.view === sut.tableView,
            ".view is not set"
        )
    }
        
    func test_tableViewDataSourceIsConfiguredCorrectly() {
        let sut = LocationsViewController(locations: [], didSelect: {_ in})
        sut.loadViewIfNeeded()
        XCTAssertTrue(
            sut.tableView.dataSource === sut.dataSource,
            "tableView dataSource is not set"
        )
    }

    func test_dataSourceIsConfiguredCorrectly() {
        let locations = [Location(name: "Nijmegen")]
        let sut = LocationsViewController(locations: locations, didSelect: {_ in})
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.dataSource.locations, locations)
    }
    
    func test_tableViewDelegateIsSet() {
        let sut = LocationsViewController(locations: [], didSelect: {_ in})
        sut.loadViewIfNeeded()

        XCTAssertTrue(sut.tableView.delegate === sut)
    }
    
    func test_selectingLocation() {
        let locations: [Location] = [
            .init(name: "Nijmegen"),
            .init(name: "Velp")
        ]
        var capturedLocation: Location?
        let sut = LocationsViewController(locations: locations) {
            capturedLocation = $0
        }
        sut.loadViewIfNeeded()
        sut.tableView(sut.tableView, didSelectRowAt: .init(row: 1, section: 0))
        XCTAssertEqual(capturedLocation, locations[1])
    }
}
