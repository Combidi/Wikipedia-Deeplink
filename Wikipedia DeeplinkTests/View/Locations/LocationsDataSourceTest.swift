//
//  Created by Peter Combee on 21/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class LocationsDataSourceTest: XCTestCase {
    
    private var sut: LocationsDataSource!
    private let locations: [Location] = [
        .init(name: "Arnhem", coordinate: .init(latitude: 51.979605, longitude: 5.911081)),
        .init(name: "Velp", coordinate: .init(latitude: 51.9939061, longitude: 5.9735643))
    ]
    
    override func setUp() {
        sut = .init(locations)
    }
    
    func test_numberOfRows() {
        XCTAssertEqual(sut.tableView(.init(), numberOfRowsInSection: 0), locations.count)
    }
        
    func test_cell() {
        let cell = sut.tableView(.init(), cellForRowAt: .init(row: 1, section: 0))
        XCTAssertEqual(cell.textLabel?.text, locations[1].name)
    }
}
