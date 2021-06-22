//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

protocol NavigationController {
    
    func set(initialViewController: UIViewController)
    func present(viewController: UIViewController)
    func popToRoot()

}
