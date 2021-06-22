//
//  Created by Peter Combee on 21/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class LocationsViewControllerTest: XCTestCase {
    
    func test_viewIsSetCorrectly() {
        let sut = configuredSUT()
        XCTAssertTrue(
            sut.view === sut.tableView,
            ".view is not set"
        )
    }
        
    func test_tableViewDataSourceIsConfiguredCorrectly() {
        let sut = configuredSUT()
        XCTAssertTrue(
            sut.tableView.dataSource === sut.dataSource,
            "tableView dataSource is not set"
        )
    }

    func test_dataSourceIsConfiguredCorrectly() {
        let locations = [Location(name: "Nijmegen", coordinate: .init(lat: 51.9939061, long: 5.9735643))]
        let sut = configuredSUT(locations: locations)
        XCTAssertEqual(sut.dataSource.locations, locations)
    }
    
    func test_tableViewDelegateIsSet() {
        let sut = configuredSUT()
        XCTAssertTrue(sut.tableView.delegate === sut)
    }
    
    func test_selectingLocation() {
        let locations: [Location] = [
            .init(name: "Arnhem", coordinate: .init(lat: 51.979605, long: 5.911081)),
            .init(name: "Velp", coordinate: .init(lat: 51.9939061, long: 5.9735643))
        ]
        var capturedLocation: Location?
        let sut = configuredSUT(locations: locations) {
            capturedLocation = $0
        }
        sut.tableView(sut.tableView, didSelectRowAt: .init(row: 1, section: 0))
        XCTAssertEqual(capturedLocation, locations[1])
    }
    
    // MARK: Helpers
    
    func configuredSUT(
        locations: [Location] = [],
        didSelect: @escaping (Location) -> Void = {_ in}
    ) -> LocationsViewController {
        let viewController = LocationsViewController(
            locations: locations,
            didSelect: didSelect
        )
        viewController.loadViewIfNeeded()
        return viewController
    }
}
