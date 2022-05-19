import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    var timerViewModel: TimerViewModel = TimerViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        timerViewModel.timerViewController = self
    }
    
    func setSecondsLabel(text: String){
        secondsLabel.text = text
    }
    
    func setStartStopTitleButton(title: String) {
        startStopButton.setTitle(title, for: .normal)
    }
    
    func enableFinishButton(enable: Bool){
        finishButton.isEnabled = enable
    }
    
    @IBAction func toggleTimer(_ sender: Any) {
        timerViewModel.toggleTimer()
        
    }
    
    @IBAction func finishTimer(_ sender: Any) {
        if let seconds = secondsLabel.text,
           let key = title {
            timerViewModel.saveRecords(record: seconds, key: key)
            if let vc = storyboard?.instantiateViewController(withIdentifier: "SuccessViewController") as? SuccessViewController {
                vc.title = key
                vc.setTimeLabel(seconds: seconds)
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}
