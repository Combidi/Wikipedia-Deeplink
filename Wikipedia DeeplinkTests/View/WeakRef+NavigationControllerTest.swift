//
//  Created by Peter Combee on 22/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class WeakRef_NavigationControllerTest: XCTestCase {
    
    var navigationController: NavigationControllerSpy!
    var sut: WeakRef<NavigationControllerSpy>!

    override func setUp() {
        navigationController = .init()
        sut = .init(navigationController)
    }
    
    func test_setInitialViewController() {
        let expectedViewController = UIViewController()
        sut.set(initialViewController: expectedViewController)
        XCTAssertTrue(navigationController.capturedInitialViewController === expectedViewController)
    }

    func test_presentViewController() {
        let expectedViewController = UIViewController()
        sut.present(viewController: expectedViewController)
        XCTAssertTrue(navigationController.capturedViewController_present === expectedViewController)
    }
    
    func test_popToRoot() {
        sut.popToRoot()
        XCTAssertTrue(navigationController.popToRootCalled)
    }

}
