//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

class RoutableNavigationController: UINavigationController {
 
    private var routable: Routable!
    
    convenience init(routable: Routable) {
        self.init()
        self.routable = routable
        self.routable.navigationController = WeakRef(self) // Using WeakRef to prevent a retain cycle
    }
    
    override func viewDidLoad() {
        routable.start()
    }
        
}
