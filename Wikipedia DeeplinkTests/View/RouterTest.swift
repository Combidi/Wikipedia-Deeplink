//
//  Created by Peter Combee on 22/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink
import UIKit

class RouterTest: XCTestCase {
    
    func test_start_navigatesToLocationsSelectionViewController() {
        let factory = FactorySpy()
        let navigationController = NavigationControllerSpy()
        let sut = Router(factory: factory, navigationController: navigationController)
        sut.start()
        XCTAssertNotNil(navigationController.capturedInitialViewController)
        XCTAssertTrue(navigationController.capturedInitialViewController === factory.locationSelectionViewControllerStub)
    }
    
    func test_routing() {
        let factory = FactorySpy()
        let navigationController = NavigationControllerSpy()
        var sut = Router(factory: factory, navigationController: navigationController)
        sut.start()
        sut.currentDestination = .coordinateForm
        XCTAssertNotNil(navigationController.capturedViewController_present)
        XCTAssertTrue(navigationController.capturedViewController_present === factory.coordinateFormViewControllerStub)
        sut.currentDestination = .locationSelection
        XCTAssertTrue(navigationController.popToRootCalled)
    }
}

fileprivate class FactorySpy: Factory {
            
    let locationSelectionViewControllerStub = UIViewController()
    
    func makeLocationSelectionViewController() -> UIViewController {
        return locationSelectionViewControllerStub
    }

    let coordinateFormViewControllerStub = UIViewController()
    
    func makeCoordinationFormViewController() -> UIViewController {
        return coordinateFormViewControllerStub
    }

}

fileprivate class NavigationControllerSpy: NavigationController {
    
    var capturedInitialViewController: UIViewController!
    func set(initialViewController: UIViewController) {
        capturedInitialViewController = initialViewController
    }
    
    var capturedViewController_present: UIViewController!
    func present(viewController: UIViewController) {
        capturedViewController_present = viewController
    }
    
    var popToRootCalled = false
    func popToRoot() {
        popToRootCalled = true
    }
}
