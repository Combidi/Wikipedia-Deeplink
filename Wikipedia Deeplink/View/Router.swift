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
    
    init(
        store: Store,
        factory: Factory
    ) {
        self.store = store
        self.factory = factory
    }

    var navigationController: NavigationController?
    
    var currentDestination: Destination = .locationSelection {
        didSet {
            switch currentDestination {
            case .locationSelection:
                navigationController?.popToRoot()
            case .coordinateForm:
                navigationController?.present(viewController: coordinationFormViewController)
            }
        }
    }
    
    func start() {
        navigationController?.set(initialViewController: locationSelectionViewController)
    }
    
    private var locationSelectionViewController: UIViewController {
        factory.makeLocationSelectionViewController(
            locations: store.state.locations,
            didSelect: { [unowned self] in
                store.dispatch(action: .openWikipedia($0.coordinate))
                let testController = UIViewController()
                testController.view.backgroundColor = .red
            }
        )
    }
    
    private var coordinationFormViewController: UIViewController {
        factory.makeCoordinationFormViewController(didCommit: { [unowned self] in
            store.dispatch(action: .openWikipedia($0))
        })
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
