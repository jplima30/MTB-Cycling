
import UIKit

class SuccessViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var timeText = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        timeLabel.text = timeText
    }
    
    func setTimeLabel(seconds: String) {
        timeText = "Seu tempo foi de: \(seconds) segundos"
    }
        
    @IBAction func congratulationsButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
