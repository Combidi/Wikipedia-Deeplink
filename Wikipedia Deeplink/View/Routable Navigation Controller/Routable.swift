//
//  Created by Peter Combee on 22/06/2021.
//

protocol Routable {

    var navigationController: NavigationController? { get set }
    
    func start()

}
