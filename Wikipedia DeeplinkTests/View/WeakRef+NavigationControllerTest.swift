//
//  Created by Peter Combee on 22/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class WeakRef_NavigationControllerTest: XCTestCase {
    
    func test_setInitialViewController() {
        let navigationController = NavigationControllerSpy()
        let sut = WeakRef(navigationController)
        let expectedViewController = UIViewController()
        sut.set(initialViewController: expectedViewController)
        XCTAssertTrue(navigationController.capturedInitialViewController === expectedViewController)
    }

    func test_presentViewController() {
        let navigationController = NavigationControllerSpy()
        let sut = WeakRef(navigationController)
        let expectedViewController = UIViewController()
        sut.present(viewController: expectedViewController)
        XCTAssertTrue(navigationController.capturedViewController_present === expectedViewController)
    }
    
    func test_popToRoot() {
        let navigationController = NavigationControllerSpy()
        let sut = WeakRef(navigationController)
        sut.popToRoot()
        XCTAssertTrue(navigationController.popToRootCalled)
    }

}
