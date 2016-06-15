import UIKit

class ViewController : UIViewController {
    // MARK: Properties

    @IBOutlet private var cardSlots: [UIImageView]!
    @IBOutlet weak private var generateButton: UIButton!

    private var highlightTimer: NSTimer?
    private var lastHighlightedCoordinates:
        ((Int, Int, Int, Int), (Int, Int, Int, Int), (Int, Int, Int, Int))?
    private var setCoordinates:
        [((Int, Int, Int, Int), (Int, Int, Int, Int), (Int, Int, Int, Int))]

    required init?(coder aDecoder: NSCoder) {
        setCoordinates = coordinatesOfSets()
        super.init(coder: aDecoder)
    }

    @IBAction func onGenerateClick(sender: UIButton) {
        let hypercube = populateHypercube()
        
        highlightSetsIn(hypercube)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareCardSlots()
    }

    private func prepareCardSlots() {
        cardSlots = cardSlots.sort({ f, s in f.tag < s.tag })

        for s in cardSlots {
            styleCardSlot(s)
            unhighlightCardSlot(s)
        }
    }
    
    private func populateHypercube() -> Hypercube {
        let deck = Deck()
        
        let hypercube = buildHypercube(deck)
        
        for cube in 0...2 {
            for plane in 0...2 {
                for row in 0...2 {
                    for column in 0...2 {
                        cardSlots[cube * 27 + plane * 9 + row * 3 + column].image =
                            imageFor(hypercube[cube][plane][row][column]!)
                    }
                }
            }
        }
        
        return hypercube
    }

    private func highlightSetsIn(hypercube: Hypercube) {
        if let t = highlightTimer {
            t.invalidate()
        }

        for s in cardSlots {
            unhighlightCardSlot(s)
        }
        
        highlightTimer =
            NSTimer.scheduledTimerWithTimeInterval(
                1.5,
                target: self,
                selector: #selector(highlightASet),
                userInfo: hypercube,
                repeats: true)
    }

    private func styleCardSlot(slot: UIImageView) {
        slot.layer.borderWidth = 2
        slot.layer.cornerRadius = 3.5
        slot.layer.masksToBounds = true
    }

    private func highlightCardSlot(slot: UIImageView) {
        slot.layer.borderColor = UIColor.yellowColor().CGColor
    }

    private func unhighlightCardSlot(slot: UIImageView) {
        slot.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    func highlightASet(timer: NSTimer!) {
        if let c = lastHighlightedCoordinates {
            unhighlightCardSlot(cardSlots[cardViewCoordinate(c.0)])
            unhighlightCardSlot(cardSlots[cardViewCoordinate(c.1)])
            unhighlightCardSlot(cardSlots[cardViewCoordinate(c.2)])
        }

        let hypercube = timer.userInfo as! Hypercube
        let next = setCoordinates.randomItem()
        assert(
            formASet(
                hypercube[next.0.0][next.0.1][next.0.2][next.0.3]!,
                hypercube[next.1.0][next.1.1][next.1.2][next.1.3]!,
                hypercube[next.2.0][next.2.1][next.2.2][next.2.3]!
            )
        )
        
        highlightCardSlot(cardSlots[cardViewCoordinate(next.0)])
        highlightCardSlot(cardSlots[cardViewCoordinate(next.1)])
        highlightCardSlot(cardSlots[cardViewCoordinate(next.2)])
        lastHighlightedCoordinates = next
    }
}
