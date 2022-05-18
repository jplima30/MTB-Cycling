
import Foundation

class TimerViewModel {
   weak var timerViewController: TimerViewController?
    
    var timer: Timer?
    var isRunning: Bool = false
    var runCount: Int = 0
    
    func toggleTimer(){
        if isRunning {
            stopTimer()
            isRunning = false
            timerViewController?.setStartStopTitleButton(title: "Start")
            timerViewController?.enableFinishButton(enable: true)
        } else {
            starTimer()
            isRunning = true
            timerViewController?.setStartStopTitleButton(title: "Stop")
            timerViewController?.enableFinishButton(enable: false)
        }
    }
    
    private func starTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
   private func stopTimer() {
        timer?.invalidate()
    }
    
   @objc func fireTimer() {
        runCount += 1
       timerViewController?.setSecondsLabel(text: "\(runCount)")
    }
    
    func saveRecords(record: String, key: String) {
        if hasNewRecord(record: record, key: key){
            UserDefaults.standard.set(record, forKey: key)
        }
        
    }
    
    private func hasNewRecord(record: String, key: String) -> Bool {
        if let newRecord = Int(record),
           let oldRecord = Int(getRecords(key: key)){
            if newRecord > oldRecord {
                return true
            }
        }
        return false
    }
    
    func getRecords(key: String) -> String  {
        
        return UserDefaults.standard.object(forKey: key) as? String ?? "0"
    }
}
