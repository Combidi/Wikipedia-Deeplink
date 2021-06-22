//
//  Created by Peter Combee on 22/06/2021.
//

import UIKit

class BarButtonItem: UIBarButtonItem {
    
    private var tapAction: (() -> Void)?

    init(title: String, action: @escaping () -> Void) {
        self.init(title: title, style: .done, target: nil, action: nil)
        tapAction = action
        self.target = self
        self.action = #selector(performAction)
    }
    
    override init() {
        super.init()
        self.target = self
        self.action = #selector(performAction)
    }
       
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
   
    required init(barButtonSystemItem: UIBarButtonItem.SystemItem) {
        fatalError()
    }
   
    required init(title: String) {
        fatalError()
    }
   
    required init(image: UIImage) {
        fatalError()
    }
    
    @objc func performAction() {
        tapAction?()
    }
    
}
