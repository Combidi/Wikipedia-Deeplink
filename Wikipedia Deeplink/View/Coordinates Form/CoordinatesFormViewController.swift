//
//  Created by Peter Combee on 21/06/2021.
//

import UIKit

class CoordinatesFormViewController: UIViewController {
    
    private(set) var commit: ((Coordinate) -> Void)!
    
    convenience init(commit: @escaping (Coordinate) -> Void) {
        self.init()
        self.commit = commit
    }

    @IBOutlet private(set) var latitudeField: UITextField!
    @IBOutlet private(set) var longitudeField: UITextField!
    @IBOutlet private(set) var commitButton: UIButton!

    @IBAction func commitButtonAction() -> Void {
        guard
            let latitude = Double(latitudeField.text!),
            let longitude = Double(longitudeField.text!)
        else {
            let alert = UIAlertController(
                title: "Troep!",
                message: "nog meer troep",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        commit(.init(lat: latitude, long: longitude))
    }
        
}

#if DEBUG
import SwiftUI

struct CoordinatesFormViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable(CoordinatesFormViewController(commit: {_ in}))
    }
}
#endif
