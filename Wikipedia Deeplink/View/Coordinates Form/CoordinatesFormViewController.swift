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
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var commitButton: UIButton!

    @IBAction func commitButtonAction() -> Void {
        guard
            let latitude = Double(latitudeField.text!),
            let longitude = Double(longitudeField.text!)
        else {
            return
        }
        commit(.init(latitude: latitude, longitude: longitude))
    }
    
    override func viewDidLoad() {
        configureSubviews()
    }
        
    private func configureSubviews() {
        
        latitudeField.placeholder = "Latitude"
        latitudeField.keyboardType = .decimalPad
        latitudeField.autocorrectionType = .no
        latitudeField.becomeFirstResponder()
        
        longitudeField.placeholder = "Longitude"
        longitudeField.keyboardType = .decimalPad
        longitudeField.autocorrectionType = .no
        
        titleLabel.text = "This button will only work if both fields values can be converted to Double 🙄"
        
        commitButton.setTitle("Lets go! ", for: .normal)
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
