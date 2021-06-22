//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

extension UINavigationController: NavigationController {
    
    func set(initialViewController: UIViewController) {
        viewControllers = [initialViewController]
    }
    
    func present(viewController: UIViewController) {
        present(viewController, animated: true)
    }
    
    func popToRoot() {
        popToRootViewController(animated: true)
    }

}

