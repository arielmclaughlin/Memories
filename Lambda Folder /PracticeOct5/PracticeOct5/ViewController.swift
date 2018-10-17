import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func doubleTapped(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

