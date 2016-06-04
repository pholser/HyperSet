import Foundation

enum Number : Int {
    case Three = 0
    case One = 1
    case Two = 2
    
    static let all: Array<Number> = [.Three, .One, .Two]
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
    
    static let all: Array<Color> = [.Red, .Green, .Purple]
}
