//
//  Created by Peter Combee on 21/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class LocationsDataSourceTest: XCTestCase {
    
    func test_numberOfRows() {
        let locations = [
            Location(name: "Arnhem"),
            Location(name: "Velp")
        ]
        let sut = LocationsDataSource(locations)
        XCTAssertEqual(sut.tableView(.init(), numberOfRowsInSection: 0), locations.count)
    }
        
    func test_cell() {
        let locations = [
            Location(name: "Arnhem"),
            Location(name: "Velp")
        ]
        let sut = LocationsDataSource(locations)
        let cell = sut.tableView(.init(), cellForRowAt: .init(row: 1, section: 0))
        XCTAssertEqual(cell.textLabel?.text, locations[1].name)
    }
}
