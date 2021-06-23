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
            return
        }
        commit(.init(lat: latitude, long: longitude))
    }
    
    override func viewDidLoad() {
        configureSubviews()
    }
    
    private func configureSubviews() {
        latitudeField.placeholder = "Latitude"
        longitudeField.placeholder = "Longitude"
        commitButton.setTitle("Commit", for: .normal)
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
