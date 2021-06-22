//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

protocol Factory {

    func makeLocationSelectionViewController(
        locations: [Location],
        didSelect: @escaping (Location) -> Void
    ) -> UIViewController
    
    func makeCoordinationFormViewController(
        didCommit: @escaping (Coordinate) -> Void
    ) -> UIViewController

}

protocol NavigationController {
    
    func set(initialViewController: UIViewController)
    func present(viewController: UIViewController)
    func popToRoot()

}

class Router {
        
    enum Destination {
        case locationSelection
        case coordinateForm
    }
    
    private let store: Store
    private let factory: Factory
    private let navigationController: NavigationController
    
    init(store: Store, factory: Factory, navigationController: NavigationController) {
        self.store = store
        self.factory = factory
        self.navigationController = navigationController
    }
    
    var currentDestination: Destination = .locationSelection {
        didSet {
            switch currentDestination {
            case .locationSelection:
                navigationController.popToRoot()
            case .coordinateForm:
                let viewController = factory.makeCoordinationFormViewController(
                    didCommit: { [unowned self] in store.dispatch(action: .openWikipedia($0)) }
                )
                navigationController.present(viewController: viewController)
            }
        }
    }
    
    func start() {
        let viewController = factory.makeLocationSelectionViewController(
            locations: store.state.locations,
            didSelect: { [unowned self] in store.dispatch(action: .openWikipedia($0.coordinate)) }
        )
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
