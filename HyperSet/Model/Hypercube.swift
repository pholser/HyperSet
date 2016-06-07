import Foundation

class Hypercube {
    var cubes = [Cube?](count: 3, repeatedValue: nil)
    
    init(_ first: Cube, _ second: Cube, _ third: Cube) {
        cubes[0] = first
        cubes[1] = second
        cubes[2] = third
    }
    
    var isMagic : Bool {
        if [cubes[0]!.isMagic, cubes[1]!.isMagic, cubes[2]!.isMagic]
            .contains(false) {
            return false
        }

        let coordinates: [(Int, Int)] =
            (0...2).flatMap { (cube: Int) in
                (0...2).flatMap { (plane: Int) in
                    return (cube, plane)
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
                first.0 != second.0 && first.0 != third.0 && second.0 != third.0
                    && mod3Plus(first.0, second.0, third.0) == 0
                    && mod3Plus(first.1, second.1, third.1) == 0
            }
        
        return !triples.map { (first: (Int, Int), second: (Int, Int), third: (Int, Int)) in
            Cube(
                cubes[first.0]!.squares[first.1]!,
                cubes[second.0]!.squares[second.1]!,
                cubes[third.0]!.squares[third.1]!)
            .isMagic
        }.contains(false)
    }
}
