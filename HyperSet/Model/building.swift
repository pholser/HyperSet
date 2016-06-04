import Foundation

func buildFirstPlane(deck: Deck) -> Square {
    let plane = Square()

    let upperLeft = deck.draw()!
    let midLeft = deck.draw()!
    let upperMid = deck.drawMismatch(upperLeft, second: midLeft)!
    let upperRight = deck.remove(completionOf(upperLeft, second: upperMid))!
    let lowerLeft = deck.remove(completionOf(upperLeft, second: midLeft))!
    let center = deck.remove(completionOf(upperRight, second: lowerLeft))!
    let midRight = deck.remove(completionOf(midLeft, second: center))!
    let lowerMid = deck.remove(completionOf(upperMid, second: center))!
    let lowerRight = deck.remove(completionOf(lowerLeft, second: lowerMid))!
    
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
