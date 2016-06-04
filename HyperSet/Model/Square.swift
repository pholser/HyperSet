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
        let rows = formASet(cards[0][0]!, second: cards[0][1]!, third: cards[0][2]!)
            && formASet(cards[1][0]!, second: cards[1][1]!, third: cards[1][2]!)
            && formASet(cards[2][0]!, second: cards[2][1]!, third: cards[2][2]!)
        let columns = formASet(cards[0][0]!, second: cards[1][0]!, third: cards[2][0]!)
            && formASet(cards[0][1]!, second: cards[1][1]!, third: cards[2][1]!)
            && formASet(cards[0][2]!, second: cards[1][2]!, third: cards[2][2]!)
        let leftDiagonals = formASet(cards[0][0]!, second: cards[1][1]!, third: cards[2][2]!)
            && formASet(cards[0][1]!, second: cards[1][2]!, third: cards[2][0]!)
            && formASet(cards[0][2]!, second: cards[1][0]!, third: cards[2][1]!)
        let rightDiagonals = formASet(cards[0][2]!, second: cards[1][1]!, third: cards[2][0]!)
            && formASet(cards[1][2]!, second: cards[2][1]!, third: cards[0][0]!)
            && formASet(cards[2][2]!, second: cards[0][1]!, third: cards[1][0]!)
        return rows && columns && leftDiagonals && rightDiagonals
        
    }
}
