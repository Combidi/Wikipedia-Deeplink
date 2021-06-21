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
        
}
