//
//  Created by Peter Combee on 21/06/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private let store = makeStore()
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = rootViewController
        self.window = window
        window.makeKeyAndVisible()
    }

    private var rootViewController: UIViewController {
        RoutableNavigationController(routable: Router(
            store: store,
            factory: ViewControllerFactory()
        ))
    }
}

extension Router: Routable {}
