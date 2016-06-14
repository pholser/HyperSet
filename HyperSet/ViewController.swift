import UIKit

class ViewController : UIViewController {
    // MARK: Properties

    @IBOutlet var cardSlots: [UIImageView]!
    @IBOutlet weak private var generateButton: UIButton!
    
    @IBAction func onGenerateClick(sender: UIButton) {
//        let deck = Deck()
        
//        let hypercube = buildHypercube(deck)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        cardSlots = cardSlots.sort({ f, s in f.tag < s.tag })
        for s in cardSlots {
            print(s.tag)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
