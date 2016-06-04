import Foundation

extension Set {
    func randomElement() -> Element? {
        let randomInt = Int(arc4random_uniform(UInt32(self.count)))
        let index = startIndex.advancedBy(randomInt)
        return count == 0 ? nil : self[index]
    }
}
