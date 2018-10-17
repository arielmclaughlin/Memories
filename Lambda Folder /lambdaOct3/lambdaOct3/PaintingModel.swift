import UIKit

class PaintingModel: NSObject, UITableViewDataSource {
    
    var imageArray = [UIImage]()
    
    override init() {
        for n in ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"] {
            if let image = UIImage(named: String(n)) {
                imageArray.append(image)
                }
            }
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    let reuseIdentifier = "cell"
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
            fatalError("Could not insntiate guranteed cell type")
        }
        
        
        return cell
    }
}
