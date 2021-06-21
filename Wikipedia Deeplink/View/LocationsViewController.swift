//
//  Created by Peter Combee on 21/06/2021.
//

import UIKit

class LocationsViewController: UIViewController {
        
    override func viewDidLoad() {
        view.backgroundColor = .yellow
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
