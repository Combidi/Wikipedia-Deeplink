//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

protocol Factory {

    func makeLocationSelectionViewController() -> UIViewController
    func makeCoordinationFormViewController() -> UIViewController

}

protocol NavigationController {
    
    func set(initialViewController: UIViewController)
    func present(viewController: UIViewController)
    func popToRoot()

}

struct Router {
        
    enum Destination {
        case locationSelection
        case coordinateForm
    }
    
    private let factory: Factory!
    private let navigationController: NavigationController
    
    init(factory: Factory, navigationController: NavigationController) {
        self.factory = factory
        self.navigationController = navigationController
    }
    
    var currentDestination: Destination = .locationSelection {
        didSet {
            switch currentDestination {
            case .locationSelection:
                navigationController.popToRoot()
            case .coordinateForm:
                let viewController = factory.makeCoordinationFormViewController()
                navigationController.present(viewController: viewController)
            }
        }
    }
    
    func start() {
        let viewController = factory.makeLocationSelectionViewController()
        navigationController.set(initialViewController: viewController)
    }
}

#if DEBUG
import SwiftUI

struct NavigationController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable(UINavigationController())
    }
}
#endif
