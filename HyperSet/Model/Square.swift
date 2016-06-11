import Foundation

class Square {
    private var cards = [[Card?]](
        count: 3,
        repeatedValue: [Card?](
            count: 3,
            repeatedValue: nil
        )
    )

    private var anyMissing : Bool {
        let upperMissing = cards[0].indexOf({ $0 == nil }) != nil
        let midMissing = cards[1].indexOf({ $0 == nil }) != nil
        let lowerMissing = cards[2].indexOf({ $0 == nil }) != nil
        return upperMissing || midMissing || lowerMissing
    }

    var isMagic : Bool {
        if anyMissing {
            return false
        }

        let coordinates =
            (0...2).flatMap { row in
                (0...2).flatMap { column in
                    return (row, column)
                }
            }
        
        let triples =
            coordinates.flatMap { first in
                coordinates.flatMap { second in
                    coordinates.flatMap { third in
                        return (first, second, third)
                    }
                }
            }.filter { (first: (Int, Int), second: (Int, Int), third: (Int, Int)) in
                mod3Plus(first.0, second.0, third.0) == 0
                    && mod3Plus(first.1, second.1, third.1) == 0
            }

        return !triples.map { (first, second, third) in
            formASet(
                self[first.0][first.1]!,
                self[second.0][second.1]!,
                self[third.0][third.1]!)
        }.contains(false)
    }
    
    subscript(index: Int) -> [Card?] {
        get {
            return cards[index]
        }
        set {
            cards.insert(newValue, atIndex: index)
        }
    }
}
