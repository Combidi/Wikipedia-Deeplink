//
//  Created by Peter Combee on 21/06/2021.
//

import UIKit

class LocationsViewController: UIViewController {
        
    private(set) var dataSource: LocationsDataSource!

    convenience init(locations: [Location]) {
        self.init()
        dataSource = .init(locations)
    }

    let tableView = UITableView()
    
    override func loadView() {
        view = tableView
    }
}

#if DEBUG
import SwiftUI

struct LocationsViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable(LocationsViewController())
    }
}
#endif
