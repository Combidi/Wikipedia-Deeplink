//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

class Router {
        
    enum Destination {
        case locationSelection
        case coordinateForm
    }
    
    private let store: Store
    private let factory: Factory
    
    init(store: Store, factory: Factory) {
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
    
    private var coordinationFormViewController: UIViewController {
        factory.makeCoordinationFormViewController(didCommit: { [unowned self] in
            store.dispatch(action: .openWikipedia($0))
        })
    }
    
    private var locationSelectionViewController: UIViewController {
        let viewController = factory.makeLocationSelectionViewController(
            locations: store.state.locations,
            didSelect: { [unowned self] in
                store.dispatch(action: .openWikipedia($0.coordinate))
            }
        )
        viewController.navigationItem.rightBarButtonItem = customCoordinateButton
        return viewController
    }
        
    private var customCoordinateButton: BarButtonItem {
        BarButtonItem(title: "Custom", action: { [unowned self] in
            self.currentDestination = .coordinateForm
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
