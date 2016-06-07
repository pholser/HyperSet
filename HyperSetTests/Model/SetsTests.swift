import SwiftCheck
import XCTest

class SetsTests : XCTestCase {
    func testCompletion() {
        let first = Card(number: .One, shading: .Striped, color: .Red, shape: .Oval)
        let second = Card(number: .Two, shading: .Striped, color: .Purple, shape: .Diamond)
        
        let expectedCompletion =
            Card(number: .Three, shading: .Striped, color: .Green, shape: .Squiggle)
        
        XCTAssertEqual(expectedCompletion, completionOf(first, second))
    }
    
    func testThirdCardCompletesASet() {
        property("third card completes a set") <- forAll { (first: Card, second: Card) in
            let third = completionOf(first, second)
            
            return formASet(first, second, third)
        }
    }
}
