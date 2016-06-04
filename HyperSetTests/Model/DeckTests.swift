import XCTest

class DeckTests : XCTestCase {
    var deck: Deck!
    
    override func setUp() {
        super.setUp()
        
        self.deck = Deck()
    }
    
    func testInitialSize() {
        XCTAssertEqual(self.deck.cards.count, 81)
    }
    
    func testDraw() {
        let choice = self.deck.draw()
        
        XCTAssertEqual(self.deck.cards.count, 80)
        XCTAssertNotNil(choice)
        XCTAssertFalse(self.deck.cards.contains(choice!))
    }
}
