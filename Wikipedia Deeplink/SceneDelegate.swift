//
//  Created by Peter Combee on 21/06/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = RoutableNavigationController(routable: Router(
                store: .init(
                    application: UIApplication.shared,
                    initialState: .init(locations: [
                        .init(name: "Arnhem", coordinate: .init(lat: 51.979605, long: 5.911081)),
                        .init(name: "Velp", coordinate: .init(lat: 51.9939061, long: 5.9735643))
                    ])
                ),
                factory: ViewControllerFactory()
            ))
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

extension Router: Routable {}
