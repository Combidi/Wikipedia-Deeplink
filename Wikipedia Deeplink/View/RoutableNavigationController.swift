//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

protocol Routable {
    func start()
    var navigationController: NavigationController? { get set }
}

class RoutableNavigationController: UINavigationController {
 
    private var routable: Routable!
    
    convenience init(routable: Routable) {
        self.init()
        self.routable = routable
        #warning("This will result in memory leaks!")
        self.routable.navigationController = self
    }
    
    override func viewDidLoad() {
        routable.start()
    }
        
}
