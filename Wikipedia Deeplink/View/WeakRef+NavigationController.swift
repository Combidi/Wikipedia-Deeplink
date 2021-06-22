//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

extension WeakRef: NavigationController where T: NavigationController {
    
    func set(initialViewController: UIViewController) {
        object?.set(initialViewController: initialViewController)
    }
    
    func present(viewController: UIViewController) {
        object?.present(viewController: viewController)
    }
    
    func popToRoot() {
        object?.popToRoot()
    }
    
}
