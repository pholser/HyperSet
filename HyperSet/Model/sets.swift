import Foundation

func completionOf(first: Card, _ second: Card) -> Card {
    return Card(
        number: Number(rawValue: missingAttribute(first.number.rawValue, second: second.number.rawValue))!,
        shading: Shading(rawValue: missingAttribute(first.shading.rawValue, second: second.shading.rawValue))!,
        color: Color(rawValue: missingAttribute(first.color.rawValue, second: second.color.rawValue))!,
        shape: Shape(rawValue: missingAttribute(first.shape.rawValue, second: second.shape.rawValue))!
    )
}

func setParallelTo(set: (Card, Card, Card), through: Card) -> (Card, Card, Card) {
    let deltaNumber = set.0.number - through.number
    let deltaShading = set.0.shading - through.shading
    let deltaColor = set.0.color - through.color
    let deltaShape = set.0.shape - through.shape

    return (
        through,
        Card(
            number: set.1.number + deltaNumber,
            shading: set.1.shading + deltaShading,
            color: set.1.color + deltaColor,
            shape: set.1.shape + deltaShape),
        Card(
            number: set.2.number + deltaNumber,
            shading: set.2.shading + deltaShading,
            color: set.2.color + deltaColor,
            shape: set.2.shape + deltaShape)
    )
}

func formASet(first: Card, _ second: Card, _ third: Card) -> Bool {
    return formASet(first.number.rawValue, second.number.rawValue, third.number.rawValue)
        && formASet(first.shape.rawValue, second.shape.rawValue, third.shape.rawValue)
        && formASet(first.shading.rawValue, second.shading.rawValue, third.shading.rawValue)
        && formASet(first.color.rawValue, second.color.rawValue, third.color.rawValue)
}

private func formASet(first: Int, _ second: Int, _ third: Int) -> Bool {
    return mod3Plus(first, second, third) == 0
}

private func missingAttribute(first: Int, second: Int) -> Int {
    let sum = first + second
    return 3 * Int(ceil(Float(sum) / 3)) - sum
}
