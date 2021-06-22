//
//  Created by Peter Combee on 22/06/2021.
//

class WeakRef<T: AnyObject> {
    
    weak var object: T?
    
    init(_ object: T) {
        self.object = object
    }
}
