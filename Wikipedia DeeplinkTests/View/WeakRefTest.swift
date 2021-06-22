//
//  Created by Peter Combee on 22/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink

class WeakRefTest: XCTestCase {
    
    func test_doesNotCreateRetainCycle() {
        var object: NSObject? = NSObject()
        let sut = WeakRef(object!)
        XCTAssertNotNil(sut.object)
        object = nil
        XCTAssertNil(sut.object)
    }
}
