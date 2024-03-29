//
//  Created by Peter Combee on 21/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class CoordinatesFormViewControllerTest: XCTestCase {
            
    func test_latitudeFieldIsConnected() {
        let sut = CoordinatesFormViewController()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.latitudeField)
    }

    func test_longitudeFieldIsConnected() {
        let sut = CoordinatesFormViewController()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.longitudeField)
    }
    
    func test_labelIsConnected() {
        let sut = CoordinatesFormViewController()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.titleLabel)
    }
    
    func test_commitButtonIsConnected() {
        let sut = CoordinatesFormViewController()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.commitButton)
    }

    func test_commitAction() {
        let latitude: Double = 51.979605
        let longitude: Double = 5.911081
        var capturedCoordinate: Coordinate?
        let sut = CoordinatesFormViewController {
            capturedCoordinate = $0
        }
        sut.loadViewIfNeeded()
        sut.latitudeField.text = String(latitude)
        sut.longitudeField.text = String(longitude)
        sut.commitButtonAction()
        let expected = Coordinate(
            latitude: latitude,
            longitude: longitude
        )
        XCTAssertEqual(capturedCoordinate, expected)
    }
    
    func test() {
        let sut = CoordinatesFormViewController()
        sut.loadViewIfNeeded()
        guard let action = sut.commitButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail("Button action for .touchUpInside is missing")
            return
        }
        XCTAssertTrue(action.contains("commitButtonAction"))
    }
    
}
