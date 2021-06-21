//
//  Created by Peter Combee on 21/06/2021.
//

import UIKit

class LocationsDataSource: NSObject, UITableViewDataSource {
    
    private let locations: [Location]
    
    init(_ locations: [Location]) {
        self.locations = locations
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locations.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = locations[indexPath.row].name
        return cell
    }
}
