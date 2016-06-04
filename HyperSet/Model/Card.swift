import Foundation

final class Card : Hashable {
    var number : Number
    var shading : Shading
    var color : Color
    var shape : Shape
    
    static func create(n: Number) -> Shading -> Color -> Shape -> Card {
        return { s in { c in { sh in Card(number: n, shading: s, color: c, shape: sh) } } }
    }

    init(number: Number, shading: Shading, color: Color, shape: Shape) {
        self.number = number
        self.shading = shading
        self.color = color
        self.shape = shape
    }
    
    var hashValue: Int {
        return number.rawValue
            + 3 * shading.rawValue
            + 9 * color.rawValue
            + 27 * shape.rawValue
    }
    
    var coordinates: (Int, Int, Int, Int) {
        return (number.rawValue, shading.rawValue, color.rawValue, shape.rawValue)
    }
}

func ==(first: Card, second: Card) -> Bool {
    return first.number == second.number
        && first.shading == second.shading
        && first.color == second.color
        && first.shape == second.shape
}

extension Card : CustomStringConvertible {
    var description: String {
        return "\(number) \(shading) \(color)"
            + " \(number == .One ? shape.description : shape.description + "s")"
    }
}
