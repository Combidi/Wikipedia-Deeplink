//
//  Created by Peter Combee on 22/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class StoreTest: XCTestCase {
    
    func test_openWikipediaURL() {
        let application = ApplicationSpy()
        let sut = Store(application: application, initialState: .init(locations: []))
        let coordinate = Coordinate(lat: 10.0, long: 20.0)
        sut.dispatch(action: .openWikipedia(coordinate))
        let expectedURL = URL(string: "wikipedia://places/?WMFCoordinate=\(coordinate.latitude),\(coordinate.longitude)")!
        XCTAssertEqual(application.capturedURL, expectedURL)        
    }
    
}
