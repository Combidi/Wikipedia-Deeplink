//
//  Created by Peter Combee on 22/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class MakStoreTest: XCTestCase {
    
    func test_applicationIsSharedUIApplication() {
        let sut = makeStore()
        XCTAssertTrue(sut.application is UIApplication)
        XCTAssertTrue(sut.application as? UIApplication === UIApplication.shared)
    }
    
}
