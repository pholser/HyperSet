import Foundation

func completionOf(first: Card, second: Card) -> Card {
    return Card(
        number: Number(rawValue: missingAttribute(first.number.rawValue, second: second.number.rawValue))!,
        shading: Shading(rawValue: missingAttribute(first.shading.rawValue, second: second.shading.rawValue))!,
        color: Color(rawValue: missingAttribute(first.color.rawValue, second: second.color.rawValue))!,
        shape: Shape(rawValue: missingAttribute(first.shape.rawValue, second: second.shape.rawValue))!
    )
}

func formASet(first: Card, second: Card, third: Card) -> Bool {
    return formASet(first.number.rawValue, second: second.number.rawValue, third: third.number.rawValue)
        && formASet(first.shape.rawValue, second: second.shape.rawValue, third: third.shape.rawValue)
        && formASet(first.shading.rawValue, second: second.shading.rawValue, third: third.shading.rawValue)
        && formASet(first.color.rawValue, second: second.color.rawValue, third: third.color.rawValue)
}

private func formASet(first: Int, second: Int, third: Int) -> Bool {
    return (first + second + third) % 3 == 0
}

private func missingAttribute(first: Int, second: Int) -> Int {
    let sum = first + second
    return 3 * Int(ceil(Float(sum) / 3)) - sum
}
