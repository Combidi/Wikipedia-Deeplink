//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

struct ViewControllerFactory: Factory {
    
    func makeLocationSelectionViewController(
        locations: [Location],
        didSelect: @escaping (Location) -> Void
    ) -> UIViewController {
        return LocationsViewController(locations: locations, didSelect: didSelect)
    }
    
    func makeCoordinationFormViewController(
        didCommit: @escaping (Coordinate) -> Void
    ) -> UIViewController {
        return CoordinatesFormViewController(commit: didCommit)
    }
    
}
