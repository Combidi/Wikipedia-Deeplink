//
//  Created by Peter Combee on 22/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class RoutableNavigationControllerTest: XCTestCase {
    
    func test_startRoutableWhenViewDidLoad() {
        let routable = RoutableSpy()
        let sut = RoutableNavigationController(routable: routable)
        sut.loadViewIfNeeded()
        XCTAssertTrue(routable.startCalled)
    }
    
    func test_retainCycle() {
        var sut: RoutableNavigationController? = .init(routable: RoutableSpy())
        weak var weakSUT = sut
        sut = nil
        XCTAssertNil(weakSUT)
    }
}

fileprivate class RoutableSpy: Routable {
    
    var navigationController: NavigationController?
    
    var startCalled = false
    func start() {
        startCalled = true
    }

}
