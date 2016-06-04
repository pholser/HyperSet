import Foundation

final class Deck {
    var cards: Set<Card>
    
    init() {
        cards = Set<Card>()
        
        for n in Number.all {
            for shade in Shading.all {
                for c in Color.all {
                    for sh in Shape.all {
                        cards.insert(Card(number: n, shading: shade, color: c, shape: sh))
                    }
                }
            }
        }
    }
    
    func draw() -> Card? {
        let choice = cards.randomElement()
        if let c = choice {
            self.cards.remove(c)
        }
        
        return choice
    }
    
    func drawMismatch(first: Card, second: Card) -> Card? {
        var drawn = [Card]()
        
        var mismatch: Card? = nil
        while let next = draw() {
            if !formASet(first, second: second, third: next) {
                mismatch = next
                break
            }
            drawn.append(next)
        }

        self.cards = self.cards.union(drawn)
        return mismatch
    }

    func remove(card: Card) -> Card? {
        return self.cards.remove(card)
    }
}
