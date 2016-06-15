import UIKit

func imageFor(card: Card) -> UIImage? {
    let name = "\(card.number.description)-\(card.shading.description)-\(card.color.description)-\(card.shape.description).gif"
    return UIImage(named: name)
}
