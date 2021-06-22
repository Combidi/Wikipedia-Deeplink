//
//  Created by Peter Combee on 22/06/2021.
//

public class WeakRef<T: AnyObject> {
    
    public weak var object: T?
    
    public init(_ object: T) {
        self.object = object
    }
}
