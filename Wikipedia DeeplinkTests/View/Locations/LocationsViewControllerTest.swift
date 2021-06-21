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
        
    func test_tableViewIsConfiguredCorrectly() {
        let sut = LocationsViewController()
        sut.loadViewIfNeeded()
        XCTAssertTrue(
            sut.tableView.dataSource === sut.dataSource,
            "tableView dataSource is not set"
        )
    }

    func test_dataSourceIsConfiguredCorrectly() {
        let locations = [Location(name: "Nijmegen")]
        let sut = LocationsViewController(locations: locations)
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.dataSource.locations, locations)
    }
}
