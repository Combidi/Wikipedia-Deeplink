//
//  Created by Peter Combee on 22/06/2021.
//

@testable import Wikipedia_Deeplink
import UIKit

class NavigationControllerSpy: NavigationController {
    
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
