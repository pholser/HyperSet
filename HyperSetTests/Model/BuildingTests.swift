import XCTest

class BuildingTests : XCTestCase {
    func testBuildingFirstPlaneFromFullDeck() {
        for _ in 1...100 {
            let plane = buildFirstPlane(Deck())
            XCTAssertTrue(plane.isMagic)
        }
    }

    func testBuildingFirstTwoPlanesFromFullDeck() {
        for _ in 1...100 {
            let deck = Deck()
            let plane = buildFirstPlane(deck)

            let parallel = buildSecondPlane(deck, plane)

            XCTAssertTrue(parallel.isMagic)
        }
    }
    
    func testBuildingThreePlanesOfCubeFromFullDeck() {
        for _ in 1...100 {
            let deck = Deck()
            let first = buildFirstPlane(deck)
            let second = buildSecondPlane(deck, first)

            let third = buildThirdPlane(deck, first, second)

            XCTAssertTrue(third.isMagic)
        }
    }
    
    func testBuildingCubeFromFullDeck() {
        for _ in 1...100 {
            let deck = Deck()
            
            let cube = buildCube(deck)
            
            XCTAssertTrue(cube.isMagic)
        }
    }
}
