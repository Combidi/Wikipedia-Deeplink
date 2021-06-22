//
//  Created by Peter Combee on 22/06/2021.
//

import Foundation
@testable import Wikipedia_Deeplink

class ApplicationSpy: Application {
    
    var capturedURL: URL!
    func open(url: URL) {
        capturedURL = url
    }

}
