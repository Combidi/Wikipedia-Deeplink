//
//  Created by Peter Combee on 22/06/2021.
//

import XCTest
@testable import Wikipedia_Deeplink
import UIKit

class RouterTest: XCTestCase {
    
    private var factory: FactorySpy!
    private var navigationController: NavigationControllerSpy!
    private var store: StoreSpy!
    private var sut: Router!
    
    private let state = State(locations: [
        .init(name: "Arnhem", coordinate: .init(lat: 51.979605, long: 5.911081)),
        .init(name: "Velp", coordinate: .init(lat: 51.9939061, long: 5.9735643))
    ])
    
    override func setUp() {
        factory = .init()
        navigationController = .init()
        store = .init(application: ApplicationSpy(), initialState: state)
        sut = .init(store: store, factory: factory)
        sut.navigationController = navigationController
    }
    
    func test_start_navigatesToLocationsSelectionViewController() {
        sut.start()
        XCTAssertNotNil(navigationController.capturedInitialViewController)
        XCTAssertTrue(navigationController.capturedInitialViewController === factory.locationSelectionViewControllerStub)
    }
    
    func test_routing() {
        sut.start()
        sut.currentDestination = .coordinateForm
        XCTAssertNotNil(navigationController.capturedViewController_present)
        XCTAssertTrue(navigationController.capturedViewController_present === factory.coordinateFormViewControllerStub)
        sut.currentDestination = .locationSelection
        XCTAssertTrue(navigationController.popToRootCalled)
    }
    
    func test_presentsCorrectlyConfiguresCoordinationFormViewController() {
        sut.start()
        sut.currentDestination = .coordinateForm
        let expectedCoordinate = Coordinate(lat: 1.0, long: 2.0)
        factory.capturedCommitClosure(expectedCoordinate)
        XCTAssertEqual(store.capturedActions.count, 1)
        XCTAssertEqual(store.capturedActions[0], .openWikipedia(expectedCoordinate))
    }
    
    func test_setsCorrectlyConfiguredLocationSelectionViewController() {
        sut.start()
        XCTAssertEqual(factory.capturedLocations, store.state.locations)
        let expectedLocation = Location(name: "Amersfoort", coordinate: .init(lat: 51.9939061, long: 5.9735643))
        factory.capturedSelectionClosure(expectedLocation)
        XCTAssertEqual(store.capturedActions.count, 1)
        XCTAssertEqual(store.capturedActions[0], .openWikipedia(expectedLocation.coordinate))
    }
    
}

fileprivate class FactorySpy: Factory {
            
    let locationSelectionViewControllerStub = UIViewController()
    var capturedLocations: [Location] = []
    var capturedSelectionClosure: ((Location) -> Void)!
    func makeLocationSelectionViewController(
        locations: [Location],
        didSelect: @escaping (Location) -> Void
    ) -> UIViewController {
        capturedLocations = locations
        capturedSelectionClosure = didSelect
        return locationSelectionViewControllerStub
    }

    let coordinateFormViewControllerStub = UIViewController()
    var capturedCommitClosure: ((Coordinate) -> Void)!
    func makeCoordinationFormViewController(
        didCommit: @escaping (Coordinate) -> Void
    ) -> UIViewController {
        capturedCommitClosure = didCommit
        return coordinateFormViewControllerStub
    }

}

fileprivate class StoreSpy: Store {
    
    var capturedActions: [Action] = []
    
    override func dispatch(action: Action) {
        capturedActions.append(action)
    }
}
