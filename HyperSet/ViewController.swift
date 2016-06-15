import UIKit

class ViewController : UIViewController {
    // MARK: Properties

    @IBOutlet private var cardSlots: [UIImageView]!
    @IBOutlet weak private var generateButton: UIButton!
    
    @IBAction func onGenerateClick(sender: UIButton) {
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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        cardSlots = cardSlots.sort({ f, s in f.tag < s.tag })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
