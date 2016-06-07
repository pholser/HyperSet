import Foundation

func mod3Plus(first: Int, _ second: Int, _ third: Int = 0) -> Int {
    return (first + second + third) % 3
}

func mod3Minus(first: Int, _ second: Int) -> Int {
    return ((first > second ? second + 3 : second) - first) % 3
}
