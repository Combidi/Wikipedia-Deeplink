//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

func makeStore() -> Store {
    Store(
        application: UIApplication.shared,
        initialState: .init(locations: [
            .init(name: "Arnhem", coordinate: .init(lat: 51.979605, long: 5.911081)),
            .init(name: "Velp", coordinate: .init(lat: 51.9939061, long: 5.9735643)),
            .init(name: "Amersfoort", coordinate: .init(lat: 52.1589984, long: 5.3428039)),
            .init(name: "Amsterdam", coordinate: .init(lat: 52.3547498, long: 4.8339215)),
            .init(name: "Nijmegen", coordinate: .init(lat: 51.8429149, long: 5.7981122)),
            .init(name: "Eindhoven", coordinate: .init(lat: 51.4485338, long: 5.4164912))
        ])
    )
}
