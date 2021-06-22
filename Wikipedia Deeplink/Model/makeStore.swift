//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

func makeStore() -> Store {
    Store(
        application: UIApplication.shared,
        initialState: .init(locations: [
            .init(name: "Arnhem", coordinate: .init(lat: 51.979605, long: 5.911081)),
            .init(name: "Velp", coordinate: .init(lat: 51.9939061, long: 5.9735643))
        ])
    )
}
