import XCTest

class BuildingTests : XCTestCase {
    func testBuildingFirstPlaneFromFullDeck() {
        for _ in 1...100 {
            let plane = buildFirstPlane(Deck())
            XCTAssertTrue(plane.isMagic)
        }
    }
}
