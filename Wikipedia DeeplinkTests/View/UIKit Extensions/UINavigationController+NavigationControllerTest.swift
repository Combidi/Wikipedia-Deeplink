//
//  Created by Peter Combee on 22/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class UINavigationController_NavigationControllerTest: XCTestCase {

    func test_popToRoot() {
        let sut = TestableUINavigationController()
        sut.popToRoot()
        XCTAssertTrue(sut.capturedAnimationFlag_popToRootViewController)
    }
    
    func test_setInitialViewController() {
        let sut = UINavigationController()
        let expectedViewController = UIViewController()
        sut.set(initialViewController: expectedViewController)
        XCTAssertTrue(sut.viewControllers.first === expectedViewController)
        XCTAssertEqual(sut.viewControllers.count, 1)
    }
    
    func test_presentViewController() {
        let sut = TestableUINavigationController()
        let expectedViewController = UIViewController()
        sut.present(viewController: expectedViewController)
        XCTAssertTrue(sut.capturedAnimationFlag_present)
        XCTAssertTrue(sut.capturedViewController_present === expectedViewController)
    }
}

fileprivate class TestableUINavigationController: UINavigationController {
    
    var capturedAnimationFlag_popToRootViewController: Bool!
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        capturedAnimationFlag_popToRootViewController = animated
        return super.popToRootViewController(animated: animated)
    }
    
    var capturedViewController_present: UIViewController!
    var capturedAnimationFlag_present: Bool!
    override func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        completion: (() -> Void)? = nil
    ) {
        capturedViewController_present = viewControllerToPresent
        capturedAnimationFlag_present = flag
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}

