import Foundation

class Square {
    var cards = [[Card?]](
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

        let coordinates: [(Int, Int)] =
            (0...2).flatMap { (row: Int) in
                (0...2).flatMap { (column: Int) in
                    return (row, column)
                }
            }
        
        let triples =
            coordinates.flatMap { (first: (Int, Int)) in
                coordinates.flatMap { (second: (Int, Int)) in
                    coordinates.flatMap { (third: (Int, Int)) in
                        return (first, second, third)
                    }
                }
            }.filter { (first: (Int, Int), second: (Int, Int), third: (Int, Int)) in
                mod3Plus(first.0, second.0, third.0) == 0
                    && mod3Plus(first.1, second.1, third.1) == 0
            }

        return !triples.map { (first: (Int, Int), second: (Int, Int), third: (Int, Int)) in
            formASet(cards[first.0][first.1]!, cards[second.0][second.1]!, cards[third.0][third.1]!)
        }.contains(false)
    }
}
