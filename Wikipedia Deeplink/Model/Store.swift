//
//  Created by Peter Combee on 22/06/2021.
//

enum Action: Equatable {
    case openWikipedia(Coordinate)
}

struct State {
    let locations: [Location]
}

class Store {
    
    private (set) var state: State
    
    init(initialState: State) {
        state = initialState
    }
    
    func dispatch(action: Action) {
        
    }
    
}
