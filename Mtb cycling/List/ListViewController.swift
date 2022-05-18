

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = ListViewModel()
    var exercices: [Model] = Model.getExercises()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.viewController = self
    }

}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exercices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        let exercise = exercices[indexPath.row]
        cell.textLabel?.text = exercise.title
        let record = viewModel.getRecords(key: exercise.title)
        cell.detailTextLabel?.text = "Record: \(record) segundos"
        cell.imageView?.image = UIImage(named:"mtb")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exercise = exercices[indexPath.row]
        if let vc = storyboard?.instantiateViewController(withIdentifier: "TimerViewController") as? TimerViewController {
            vc.title = exercise.title
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
