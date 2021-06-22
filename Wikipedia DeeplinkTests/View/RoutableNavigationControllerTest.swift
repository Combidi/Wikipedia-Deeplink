//
//  Created by Peter Combee on 22/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class RoutableNavigationControllerTest: XCTestCase {
    
    func test() {
        let routable = RoutableSpy()
        let sut = RoutableNavigationController(routable: routable)
        sut.loadViewIfNeeded()
        XCTAssertTrue(routable.startCalled)
    }
}

fileprivate class RoutableSpy: Routable {
    
    var navigationController: NavigationController?
    
    var startCalled = false
    func start() {
        startCalled = true
    }

}
