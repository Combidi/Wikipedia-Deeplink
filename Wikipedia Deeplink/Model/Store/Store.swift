//
//  Created by Peter Combee on 22/06/2021.
//

import Foundation

class Store {
    
    let application: Application
    private (set) var state: State
    
    init(application: Application, initialState: State) {
        self.application = application
        state = initialState
    }
    
    func dispatch(action: Action) {
        switch action {
        case .openWikipedia(let coordinate):
            // Reducers and Middlewares may be an interesting thing to introduce here when the application grows.
            application.open(url: wikipediaDeeplinkURL(for: coordinate))
        }
    }
    
}

fileprivate func wikipediaDeeplinkURL(for coordinate: Coordinate) -> URL {
    URL(string: "wikipedia://places/?WMFCoordinate=\(coordinate.lat),\(coordinate.long)")!
}
