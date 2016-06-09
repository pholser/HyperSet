import XCTest

class BuildingTests : XCTestCase {
    func testBuildingFirstPlaneFromFullDeck() {
        for _ in 1...100 {
            let deck = Deck()

            let plane = buildFirstPlane(deck)

            XCTAssertTrue(plane.isMagic)
            XCTAssertEqual(deck.cards.count, 72)
        }
    }

    func testBuildingFirstTwoPlanesFromFullDeck() {
        for _ in 1...100 {
            let deck = Deck()
            let plane = buildFirstPlane(deck)

            let parallel = buildSecondPlane(deck, plane)

            XCTAssertTrue(parallel.isMagic)
            XCTAssertEqual(deck.cards.count, 63)
        }
    }
    
    func testBuildingThreePlanesOfCubeFromFullDeck() {
        for _ in 1...100 {
            let deck = Deck()
            let first = buildFirstPlane(deck)
            let second = buildSecondPlane(deck, first)

            let third = buildThirdPlane(deck, first, second)

            XCTAssertTrue(third.isMagic)
            XCTAssertEqual(deck.cards.count, 54)
        }
    }
    
    func testBuildingFirstCubeFromFullDeck() {
        for _ in 1...100 {
            let deck = Deck()
            
            let cube = buildFirstCube(deck)
            
            XCTAssertTrue(cube.isMagic)
            XCTAssertEqual(deck.cards.count, 54)
        }
    }
    
    func testBuildingHypercubeFromFullDeck() {
        for _ in 1...10 {
            let deck = Deck()
            
            let hypercube = buildHypercube(deck)
            
            XCTAssertTrue(hypercube.isMagic)
            XCTAssertEqual(deck.cards.count, 0)
        }
    }
    
    func testShowHypercubeCoordinatesAndCards() {
        let deck = Deck()
        
        let hypercube = buildHypercube(deck)

        for cube in 0...2 {
            for plane in 0...2 {
                for row in 0...2 {
                    for column in 0...2 {
                        print("\((cube, plane, row, column)): \(hypercube[cube][plane][row][column]!.description)")
                    }
                }
            }
        }
    }
}
