//
//  Created by Peter Combee on 22/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class ViewControllerFactoryTest: XCTestCase {
    
    func test_makeLocationSelectionViewController() {
        let sut = ViewControllerFactory()
        let expectedLocations: [Location] = [
            .init(name: "Arnhem", coordinate: .init(lat: 51.979605, long: 5.911081)),
            .init(name: "Velp", coordinate: .init(lat: 51.9939061, long: 5.9735643))
        ]
        var capturedLocation: Location?
        guard let result = sut.makeLocationSelectionViewController(
            locations: expectedLocations,
                didSelect: { capturedLocation = $0 }
        ) as? LocationsViewController else {
            XCTFail("Should return a view controller of type LocationsViewController")
            return
        }
        XCTAssertEqual(result.dataSource.locations, expectedLocations)
        result.didSelect(expectedLocations[1])
        XCTAssertEqual(capturedLocation, expectedLocations[1])
    }
    
    func test_makeCoordinationFormViewController() {
        let sut = ViewControllerFactory()
        var capturedCoordinate: Coordinate?
        guard let result = sut.makeCoordinationFormViewController(
            didCommit: { capturedCoordinate = $0 }
        ) as? CoordinatesFormViewController else {
            XCTFail("Should return a view controller of type CoordinatesFormViewController")
            return
        }
        let expectedCoordinate = Coordinate(lat: 51.9939061, long: 5.9735643)
        result.commit(expectedCoordinate)
        XCTAssertEqual(capturedCoordinate, expectedCoordinate)
    }
    
}
