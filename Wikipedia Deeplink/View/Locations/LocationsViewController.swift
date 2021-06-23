//
//  Created by Peter Combee on 21/06/2021.
//

import UIKit

class LocationsViewController: UIViewController, UITableViewDelegate {
        
    private(set) var dataSource: LocationsDataSource!
    private(set) var didSelect: ((Location) -> Void)!
    
    convenience init(
        locations: [Location],
        didSelect: @escaping (Location) -> Void
    ) {
        self.init()
        dataSource = .init(locations)
        self.didSelect = didSelect
    }

    let tableView = UITableView(frame: .init(), style: .insetGrouped)
    
    override func loadView() {
        view = tableView
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect(dataSource.locations[indexPath.row])
    }
    
}

#if DEBUG
import SwiftUI

struct LocationsViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable(LocationsViewController(
            locations: [
                .init(name: "Arnhem", coordinate: .init(latitude: 51.979605, longitude: 5.911081)),
                .init(name: "Velp", coordinate: .init(latitude: 51.9939061, longitude: 5.9735643))
            ],
            didSelect: {_ in}
        ))
    }
}
#endif
