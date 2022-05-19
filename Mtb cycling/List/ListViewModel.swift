import Foundation

class ListViewModel {
    weak var viewController: ListViewController?
    
    func getRecords(key: String) -> String  {
        
        return UserDefaults.standard.object(forKey: key) as? String ?? "0"
    }
}
