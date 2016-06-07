import Foundation

enum Number : Int {
    case Three = 0
    case One = 1
    case Two = 2
    
    static let all: Array<Number> = [.Three, .One, .Two]
}

func + (first: Number, second: Number) -> Number {
    return Number.init(rawValue: mod3Plus(first.rawValue, second.rawValue))!
}

func - (first: Number, second: Number) -> Number {
    return Number.init(rawValue: mod3Minus(first.rawValue, second.rawValue))!
}

func formASet(first: Number, _ second: Number, _ third: Number) -> Bool {
    return mod3Plus(first.rawValue, second.rawValue, third.rawValue) == 0
}

extension Number : CustomStringConvertible {
    var description: String {
        switch (self) {
            case .Three:
                return "three"
            case .One:
                return "one"
            case .Two:
                return "two"
        }
    }
}

enum Shape : Int {
    case Oval = 0
    case Diamond = 1
    case Squiggle = 2
    
    static let all: Array<Shape> = [.Oval, .Diamond, .Squiggle]
}

func + (first: Shape, second: Shape) -> Shape {
    return Shape.init(rawValue: mod3Plus(first.rawValue, second.rawValue))!
}

func - (first: Shape, second: Shape) -> Shape {
    return Shape.init(rawValue: mod3Minus(first.rawValue, second.rawValue))!
}

func formASet(first: Shape, _ second: Shape, _ third: Shape) -> Bool {
    return mod3Plus(first.rawValue, second.rawValue, third.rawValue) == 0
}

extension Shape : CustomStringConvertible {
    var description: String {
        switch (self) {
            case .Oval:
                return "oval"
            case .Diamond:
                return "diamond"
            case .Squiggle:
                return "squiggle"
        }
    }
}

enum Shading : Int {
    case Solid = 0
    case Striped = 1
    case Open = 2
    
    static let all: Array<Shading> = [.Solid, .Striped, .Open]
}

func + (first: Shading, second: Shading) -> Shading {
    return Shading.init(rawValue: mod3Plus(first.rawValue, second.rawValue))!
}

func - (first: Shading, second: Shading) -> Shading {
    return Shading.init(rawValue: mod3Minus(first.rawValue, second.rawValue))!
}

func formASet(first: Shading, _ second: Shading, _ third: Shading) -> Bool {
    return mod3Plus(first.rawValue, second.rawValue, third.rawValue) == 0
}

extension Shading : CustomStringConvertible {
    var description: String {
        switch (self) {
            case .Solid:
                return "solid"
            case .Striped:
                return "striped"
            case .Open:
                return "open"
        }
    }
}

enum Color : Int {
    case Red = 0
    case Green = 1
    case Purple = 2
    
    static let all: Array<Color> = [.Red, .Green, .Purple]
}

func + (first: Color, second: Color) -> Color {
    return Color.init(rawValue: mod3Plus(first.rawValue, second.rawValue))!
}

func - (first: Color, second: Color) -> Color {
    return Color.init(rawValue: mod3Minus(first.rawValue, second.rawValue))!
}

func formASet(first: Color, _ second: Color, _ third: Color) -> Bool {
    return mod3Plus(first.rawValue, second.rawValue, third.rawValue) == 0
}

extension Color : CustomStringConvertible {
    var description: String {
        switch (self) {
            case .Red:
                return "red"
            case .Green:
                return "green"
            case .Purple:
                return "purple"
        }
    }
}
