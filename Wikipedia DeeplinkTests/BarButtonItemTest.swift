//
//  Created by Peter Combee on 22/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink
import UIKit

class BarButtonItemTest: XCTestCase {
    
    func test_tappingAction() {
        var tapActionCalled = false
        let sut = BarButtonItem(title: "title") {
            tapActionCalled = true
        }
        XCTAssertTrue(sut.action == #selector(BarButtonItem.performAction))
        sut.performAction()
        XCTAssertTrue(tapActionCalled)
    }
    
    func test_containsRightTitle() {
        let expectedTitle = "title"
        let sut = BarButtonItem(title: expectedTitle, action: {})
        XCTAssertEqual(sut.title, expectedTitle)
    }
    
    func test_isOfRightStyle() {
        let sut = BarButtonItem(title: "", action: {})
        XCTAssertTrue(sut.style == .done)
    }
    
}

