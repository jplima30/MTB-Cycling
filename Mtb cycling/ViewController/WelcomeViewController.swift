
import UIKit

class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func irParaLista(_ sender: Any) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
