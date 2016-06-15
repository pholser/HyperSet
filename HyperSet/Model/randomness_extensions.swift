import Foundation

extension Array {
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

extension Set {
    func randomElement() -> Element? {
        let randomInt = Int(arc4random_uniform(UInt32(self.count)))
        let index = startIndex.advancedBy(randomInt)
        return count == 0 ? nil : self[index]
    }
}
