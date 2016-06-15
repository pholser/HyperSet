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
    
    plane[0][0] = upperLeft
    plane[0][1] = upperMid
    plane[0][2] = upperRight
    plane[1][0] = midLeft
    plane[1][1] = center
    plane[1][2] = midRight
    plane[2][0] = lowerLeft
    plane[2][1] = lowerMid
    plane[2][2] = lowerRight
    
    return plane
}

func buildSecondPlane(deck: Deck, _ plane: Square) -> Square {
    let parallel = Square()

    let upperLeft = deck.draw()!
    let upper =
        setParallelTo(
            (plane[0][0]!, plane[0][1]!, plane[0][2]!),
            through: upperLeft)
    let upperMid = deck.remove(upper.1)!
    let upperRight = deck.remove(upper.2)!
    let left =
        setParallelTo(
            (plane[0][0]!, plane[1][0]!, plane[2][0]!),
            through: upperLeft)
    let midLeft = deck.remove(left.1)!
    let lowerLeft = deck.remove(left.2)!
    let center = deck.remove(completionOf(upperRight, lowerLeft))!
    let midRight = deck.remove(completionOf(midLeft, center))!
    let lowerMid = deck.remove(completionOf(upperMid, center))!
    let lowerRight = deck.remove(completionOf(lowerLeft, lowerMid))!

    parallel[0][0] = upperLeft
    parallel[0][1] = upperMid
    parallel[0][2] = upperRight
    parallel[1][0] = midLeft
    parallel[1][1] = center
    parallel[1][2] = midRight
    parallel[2][0] = lowerLeft
    parallel[2][1] = lowerMid
    parallel[2][2] = lowerRight

    return parallel
}

func buildThirdPlane(deck: Deck, _ first: Square, _ second: Square)
    -> Square {

    let third = Square()
    
    for row in 0...2 {
        for column in 0...2 {
            third[row][column] =
                deck.remove(
                    completionOf(first[row][column]!, second[row][column]!)
                )!
        }
    }
        
    return third
}

func buildFirstCube(deck: Deck) -> Cube {
    let first = buildFirstPlane(deck)
    let second = buildSecondPlane(deck, first)
    let third = buildThirdPlane(deck, first, second)
    
    return Cube(first, second, third)
}

func buildHypercube(deck: Deck) -> Hypercube {
    let upperCube = buildFirstCube(deck)
    
    let midLeft = buildSecondPlane(deck, upperCube[0])
    let lowerLeft = buildThirdPlane(deck, upperCube[0], midLeft)
    let center = buildThirdPlane(deck, lowerLeft, upperCube[2])
    let lowerMid = buildThirdPlane(deck, upperCube[1], center)
    let midRight = buildThirdPlane(deck, midLeft, center)
    let lowerRight = buildThirdPlane(deck, lowerLeft, lowerMid)
    
    return Hypercube(
        upperCube,
        Cube(midLeft, center, midRight),
        Cube(lowerLeft, lowerMid, lowerRight)
    )
}

func coordinatesOfSets()
    -> [((Int, Int, Int, Int), (Int, Int, Int, Int), (Int, Int, Int, Int))] {

    let coordinates =
        (0...2).flatMap { cube in
            (0...2).flatMap { plane in
                (0...2).flatMap { row in
                    (0...2).flatMap { column in
                        return (cube, plane, row, column)
                    }
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
        }
    
    return triples.filter { first, second, third in
        first != second && first != third && second != third
            && mod3Plus(first.0, second.0, third.0) == 0
            && mod3Plus(first.1, second.1, third.1) == 0
            && mod3Plus(first.2, second.2, third.2) == 0
    }
}
