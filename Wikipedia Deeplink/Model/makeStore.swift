//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

func makeStore() -> Store {
    Store(
        application: UIApplication.shared,
        initialState: .init(locations: [
            .init(name: "Arnhem", coordinate: .init(latitude: 51.979605, longitude: 5.911081)),
            .init(name: "Velp", coordinate: .init(latitude: 51.9939061, longitude: 5.9735643)),
            .init(name: "Amersfoort", coordinate: .init(latitude: 52.1589984, longitude: 5.3428039)),
            .init(name: "Amsterdam", coordinate: .init(latitude: 52.3547498, longitude: 4.8339215)),
            .init(name: "Nijmegen", coordinate: .init(latitude: 51.8429149, longitude: 5.7981122)),
            .init(name: "Eindhoven", coordinate: .init(latitude: 51.4485338, longitude: 5.4164912))
        ])
    )
}
