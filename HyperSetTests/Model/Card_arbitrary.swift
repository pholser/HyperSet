import SwiftCheck

extension Card : Arbitrary {
    static var arbitrary : Gen<Card> {
        return Card.create <^> Number.arbitrary <*> Shading.arbitrary <*> Color.arbitrary <*> Shape.arbitrary
    }
}
