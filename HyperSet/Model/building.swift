import Foundation

func buildFirstPlane(deck: Deck) -> Square {
    let plane = Square()

    let upperLeft = deck.draw()!
    let midLeft = deck.draw()!
    let upperMid = deck.drawMismatch(upperLeft, second: midLeft)!
    let upperRight = deck.remove(completionOf(upperLeft, upperMid))!
    let lowerLeft = deck.remove(completionOf(upperLeft, midLeft))!
    let center = deck.remove(completionOf(upperRight, lowerLeft))!
    let midRight = deck.remove(completionOf(midLeft, center))!
    let lowerMid = deck.remove(completionOf(upperMid, center))!
    let lowerRight = deck.remove(completionOf(lowerLeft, lowerMid))!
    
    plane.cards[0][0] = upperLeft
    plane.cards[0][1] = upperMid
    plane.cards[0][2] = upperRight
    plane.cards[1][0] = midLeft
    plane.cards[1][1] = center
    plane.cards[1][2] = midRight
    plane.cards[2][0] = lowerLeft
    plane.cards[2][1] = lowerMid
    plane.cards[2][2] = lowerRight
    
    return plane
}

func buildSecondPlane(deck: Deck, _ plane: Square) -> Square {
    let parallel = Square()

    let upperLeft = deck.draw()!
    let upper =
        setParallelTo(
            (plane.cards[0][0]!, plane.cards[0][1]!, plane.cards[0][2]!),
            through: upperLeft)
    let upperMid = deck.remove(upper.1)!
    let upperRight = deck.remove(upper.2)!
    let left =
        setParallelTo(
            (plane.cards[0][0]!, plane.cards[1][0]!, plane.cards[2][0]!),
            through: upperLeft)
    let midLeft = deck.remove(left.1)!
    let lowerLeft = deck.remove(left.2)!
    let center = deck.remove(completionOf(upperRight, lowerLeft))!
    let midRight = deck.remove(completionOf(midLeft, center))!
    let lowerMid = deck.remove(completionOf(upperMid, center))!
    let lowerRight = deck.remove(completionOf(lowerLeft, lowerMid))!

    parallel.cards[0][0] = upperLeft
    parallel.cards[0][1] = upperMid
    parallel.cards[0][2] = upperRight
    parallel.cards[1][0] = midLeft
    parallel.cards[1][1] = center
    parallel.cards[1][2] = midRight
    parallel.cards[2][0] = lowerLeft
    parallel.cards[2][1] = lowerMid
    parallel.cards[2][2] = lowerRight

    return parallel
}

func buildThirdPlane(deck: Deck, _ first: Square, _ second: Square)
    -> Square {

    let third = Square()
    
    for row in 0...2 {
        for column in 0...2 {
            third.cards[row][column] =
                deck.remove(
                    completionOf(first.cards[row][column]!, second.cards[row][column]!)
                )!
        }
    }
        
    return third
}

func buildCube(deck: Deck) -> Cube {
    let first = buildFirstPlane(deck)
    let second = buildSecondPlane(deck, first)
    let third = buildThirdPlane(deck, first, second)
    
    return Cube(first, second, third)
}
