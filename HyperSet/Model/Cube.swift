import Foundation

class Cube {
    private var squares = [Square?](count: 3, repeatedValue: nil)
    
    init(_ first: Square, _ second: Square, _ third: Square) {
        squares[0] = first
        squares[1] = second
        squares[2] = third
    }
    
    var isMagic : Bool {
        if [self[0].isMagic, self[1].isMagic, self[2].isMagic]
            .contains(false) {
            return false
        }

        let coordinates =
            (0...2).flatMap { plane in
                (0...2).flatMap { row in
                    (0...2).flatMap { column in
                        return (plane, row, column)
                    }
                }
            }

        let triples =
            coordinates.flatMap { first in
                coordinates.flatMap { second in
                    coordinates.flatMap { third in
                        return (first, second, third)
                    }
                }
            }.filter { (first: (Int, Int, Int), second: (Int, Int, Int), third: (Int, Int, Int)) in
                first.0 != second.0 && first.0 != third.0 && second.0 != third.0
                    && mod3Plus(first.1, second.1, third.1) == 0
                    && mod3Plus(first.2, second.2, third.2) == 0
        }
        
        return !triples.map { (first, second, third) in
            formASet(
                self[0][first.1][first.2]!,
                self[1][second.1][second.2]!,
                self[2][third.1][third.2]!)
        }.contains(false)
    }
    
    subscript(index: Int) -> Square {
        get {
            return squares[index]!
        }
    }
}
