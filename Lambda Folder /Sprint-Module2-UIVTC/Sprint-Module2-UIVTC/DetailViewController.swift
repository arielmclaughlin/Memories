import UIKit
class DetailViewController: UIViewController {
    var indexPath: IndexPath? = nil
    
    @IBOutlet weak var Field: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    @objc
    func addEntry() {
        if let text = Field.text, !text.isEmpty {
            let entry = Entry(title: text, note: textView.text)
            Model.shared.items.append(entry)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func saveEntry() {
        
        guard let indexPath = indexPath else {
            fatalError("Failed to unwrap guaranteed indexPath")
        }
        
        if let text = Field.text, !text.isEmpty {
            let entry = Entry(title: text, note: textView.text)
            Model.shared.items[indexPath.row] = entry
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let indexPath = indexPath {
            assert(indexPath.row < Model.shared.items.count, "Out of range indexPath")
            
            let entry = Model.shared.items[indexPath.row]
            Field.text = entry.title
            textView.text = entry.note
        }
        
        let barButton = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = barButton
        switch indexPath {
        case nil: // new record
            barButton.title = "Add"
            barButton.action = #selector(addEntry)
        default: // modify record
            barButton.title = "Save"
            barButton.action = #selector(saveEntry)
        }
    }

}
