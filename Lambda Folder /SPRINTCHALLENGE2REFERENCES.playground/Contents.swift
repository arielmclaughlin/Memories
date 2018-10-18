import Cocoa

//UICollectionView and UserDefaults

//import UIKit
//
//class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//    let reuseIdentifier = "cell"
//    var images: [UIImage] = []
//    var names: [String] = ["The Old Violin","Seascape at Port-en-Bessin, Normandy","Pont Neuf, Paris","The Japanese Footbridge","At the Water's Edge","The Impasto Technique of Rembrandt","Vincent van Gogh", "Green Wheat Fields, Auvers", "The Dancing Couple", "Olive Orchard", "Farmhouse in Provence", "Niagara"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.backgroundColor = .black
//        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
//        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
//        for numbers in 1...12 {
//            guard let image = UIImage(named: "Image\(numbers)") else {fatalError("Could not load image \(numbers)")}
//            images.append(image)
//        }
//    }
//
//    let targetDimenstion: CGFloat = 320
//    let insetAmount: CGFloat = 32
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        guard let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {fatalError("Enable to get layout")}
//
//        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
//        layout.minimumLineSpacing = .greatestFiniteMagnitude
//        layout.scrollDirection = .horizontal
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return images.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell else {fatalError("Couldn't load view state")}
//        cell.imageView.image = images[indexPath.row]
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        // Fetch image
//        let image = images[indexPath.row]
//
//        // Fetch largest dimension of the image, whether width or height
//        let maxDimension = max(image.size.width, image.size.height)
//
//        // Calculate how to scale that largest dimension into `targetDimension`
//        let scale = targetDimenstion / maxDimension
//
//        // Return scaled dimensions
//        return CGSize(width: image.size.width * scale, height: image.size.height * scale)
//    }
//}

// USER PERMISSION MODEL AND LOCAL NOTIFICATIONS

//import UIKit
//import Photos
//
//class MemoryDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//    var memoryController : MemoryController?
//    var memory: Memory?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var textView: UITextView!
//    @IBOutlet weak var textField: UITextField!
//    @IBAction func photoButton(_ sender: Any)  {
//
//    }
//    @IBAction func saveButton(_ sender: Any) {
//    }
//
//    private func updateViews() {
//        guard let memory = memory else { return }
//        title = memory.title
//        textField.text = memory.title
//        textField.text = memory.bodyText
//        guard let memoryImage = UIImage(data: memory.imageData) else { return }
//        imageView.image = memoryImage
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        updateViews()
//    }
//
//    private func presentImagePickerController() {
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//            let imagePicker = UIImagePickerController()
//            imagePicker.sourceType = .photoLibrary
//            imagePicker.delegate = self
//            present(imagePicker, animated: true, completion: nil)
//        } else { return }
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        picker.dismiss(animated: true, completion: nil)
//        guard let image = info[.originalImage] as? UIImage else {return}
//        imageView.image = image
//    }
//
//    @IBAction func addPhoto(_ sender: Any) {
//        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
//        switch authorizationStatus {
//        case .authorized:
//            presentImagePickerController()
//        default:
//            PHPhotoLibrary.requestAuthorization { status in
//                if status == .authorized {
//                    self.presentImagePickerController()
//                }
//            }
//        }
//    }
//
//    @IBAction func saveMemory(_ sender: Any) {
//        guard let memoryController = memoryController else { return }
//        guard let titleText = textField.text,
//            let bodyText = textField.text,
//            let image = imageView.image,
//            let imgData = image.pngData() else { return }
//
//        guard let memory = memory else {
//            memoryController.createMemory(with: titleText, bodyText: bodyText, imageData: imgData)
//            navigationController?.popViewController(animated: true)
//            return
//        }
//        memoryController.update(memory: memory, title: titleText, bodyText: bodyText, imageData: imgData)
//        navigationController?.popViewController(animated: true)
//    }
//}

//import Foundation
//import UserNotifications
//
//class LocalNotificationHelper {
//
//    // Getting Authorization
//    func getAuthorizationStatus(completion: @escaping (UNAuthorizationStatus) -> Void) {
//        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
//            DispatchQueue.main.async {
//                completion(settings.authorizationStatus)
//            }
//        }
//    }
//
//    func scheduleDailyReminderNotification() {
//        getAuthorizationStatus { (status) in
//            if status == .authorized {
//                let identifier = "MemoryNotification"
//
//
//                // Configuring the Notification contents
//                let content = UNMutableNotificationContent()
//                content.title = "Create a Memory Today"
//                content.body = "What would you like to Remember?"
//
//                // Configure the recurring date.
//                var dateComponents = DateComponents()
//                dateComponents.calendar = Calendar.current
//
//                dateComponents.hour = 20   // 20:00 hours everyday
//
//                // Create the trigger as a repeating event.
//                let trigger = UNCalendarNotificationTrigger(
//                    dateMatching: dateComponents, repeats: true)
//
//                // Create the request
//                let request = UNNotificationRequest(identifier: identifier,
//                                                    content: content, trigger: trigger)
//
//                // Schedule the request with the system.
//                let notificationCenter = UNUserNotificationCenter.current()
//                notificationCenter.add(request) { (error) in
//                    if error != nil {
//                        // Handle any errors.
//                        NSLog("There seems to be an error: \(error)")
//                    }
//                }
//            }
//        }
//    }
//
//
//
//    // Requesting Authorization
//    func requestAuthorization(completion: @escaping (Bool) -> Void) {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
//
//            if let error = error { NSLog("Error requesting authorization status for local notifications: \(error)") }
//
//            DispatchQueue.main.async {
//                completion(success)
//            }
//        }
//    }
//
//    // Remove Pending Notification Requests
//    func removePendingNotificationRequests(withIdentifiers identifiers: [String]){
//    }
//}

//import UIKit
//
//class MemoriesTableViewController: UITableViewController {
//
//    var memory: Memory?
//    var memoryController: MemoryController = MemoryController()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewDidLoad()
//
//    }
//
//
//    // MARK: - Table view data source
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return memoryController.memories.count
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoryCell", for: indexPath)
//
//        let memory = memoryController.memories[indexPath.row]
//
//        cell.textLabel?.text = memory.title
//        cell.imageView?.image = UIImage(data: memory.imageData)
//
//        return cell
//    }
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//
//            let memory = memoryController.memories[indexPath.row]
//
//            memoryController.delete(memory: memory)
//
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//
//
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "AddDetailVC" {
//            guard let destinationVC = segue.destination as? MemoryDetailViewController else { return }
//
//            destinationVC.memoryController = memoryController
//
//        } else if segue.identifier == "CellDetailVC" {
//            guard let destinationVC = segue.destination as? MemoryDetailViewController,
//                let indexPath = tableView.indexPathForSelectedRow else { return }
//            let memory = memoryController.memories[indexPath.row]
//
//            destinationVC.memoryController = memoryController
//            destinationVC.memory = memory
//
//        }
//    }
//}

//import UIKit
//
//class OnboardingViewController: UIViewController {
//
//    let localNotificationHelper = LocalNotificationHelper()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        localNotificationHelper.getAuthorizationStatus { (authorizationStatus) in
//            if authorizationStatus == .authorized {
//                self.performSegue(withIdentifier: "PassOnboarding", sender: nil)
//            }
//        }
//
//    }
//    @IBAction func getStartedButton(_ sender: Any) {
//
//        localNotificationHelper.requestAuthorization { (wasSuccessful) in
//            if wasSuccessful {
//                self.localNotificationHelper.scheduleDailyReminderNotification()
//                self.performSegue(withIdentifier: "PassOnboarding", sender: nil)
//            }
//        }
//    }
//}

// GCD AND CLOSURES

//import Foundation
//
//struct RecipesNetworkClient {
//
//    static let recipesURL = URL(string: "https://cookbook.vapor.cloud/recipes")!
//
//    func fetchRecipes(completion: @escaping ([Recipe]?, Error?) -> Void) {
//        URLSession.shared.dataTask(with: RecipesNetworkClient.recipesURL) { (data, _, error) in
//            if let error = error {
//                completion(nil, error)
//                return
//            }
//
//            guard let data = data else {
//                completion(nil, NSError())
//                return
//            }
//
//            do {
//                let recipes = try JSONDecoder().decode([Recipe].self, from: data)
//                completion(recipes, nil)
//            } catch {
//                completion(nil, error)
//                return
//            }
//            }.resume()
//    }
//}

//import Foundation
//
//struct Recipe: Codable {
//
//    var name: String
//    var instructions: String
//
//}

//import UIKit
//
//class RecipeDetailViewController: UIViewController {
//    @IBOutlet weak var labelText: UILabel!
//    @IBOutlet weak var textView: UITextView!
//
//    var recipe: Recipe? {
//        didSet{
//            updateViews()
//        }
//    }
//
//    func updateViews() {
//        if isViewLoaded {
//            guard let recipe = recipe else { return }
//            labelText.text = recipe.name
//            textView.text = recipe.instructions
//        }
//    }
//
//    //     func updateViews(){
//    //        if isViewLoaded{
//    //            guard let name = recipe?.name,
//    //                let instructions = recipe?.instructions else {return}
//    //
//    //            recipeLabel.text = name
//    //            instructionsTextView.text = instructions
//    //        }
//    //    }
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        updateViews()
//
//
//    }
//
//
//}

//import UIKit
//
//class MainViewController: UIViewController {
//
//    let networkClient = RecipesNetworkClient()
//
//    var allRecipes:[Recipe] = [] {
//        didSet {
//            filterRecipes()
//        }
//    }
//
//    var filterdRecipes: [Recipe] = [] {
//        didSet {
//            recipesTableViewController?.recipes = filterdRecipes
//        }
//    }
//
//    func filterRecipes() {
//        DispatchQueue.main.async {
//            guard let search = self.searchTextField.text else {return}
//
//            if search == "" {
//                self.filterdRecipes = self.allRecipes
//            }else{
//                self.filterdRecipes = self.allRecipes.filter {$0.name.contains(search) || $0.instructions.contains(search)}
//            }
//        }
//
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        networkClient.fetchRecipes { (recipes, error) in
//
//            if let error = error {
//                NSLog("error getting recipes: \(error)")
//                return
//            }
//            DispatchQueue.main.async {
//                self.allRecipes = recipes ?? []
//            }
//
//
//        }
//
//        // Do any additional setup after loading the view.
//    }
//
//    @IBOutlet weak var searchTextField: UITextField!
//
//    @IBAction func DidEndonExit(_ sender: Any) {
//        resignFirstResponder()
//        filterRecipes()
//    }
//
//    var recipesTableViewController: RecipesTableViewController! {
//        didSet{
//            recipesTableViewController?.recipes = filterdRecipes
//        }
//    }
//
//    // MARK: - Navigation
//
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "RecipeSegue" {
//            recipesTableViewController = (segue.destination as! RecipesTableViewController)
//
//        }
//    }
//}

//import UIKit
//
//class RecipesTableViewController: UITableViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    var recipes: [Recipe] = [] {
//        didSet{
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//
//
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return recipes.count
//
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let recipe = recipes[indexPath.row]
//        cell.textLabel?.text = recipe.name
//        return cell
//    }
//
//}

//let array = [11, 3, 6, 2, 9]
//
////print(array.sorted(by: { $0 < $1 }))
////print(array.sorted(by: { $0 > $1 }))
////
////print(array.sorted(by: <))
////print(array.sorted(by: >))
//
//extension Int {
//    var isEven: Bool {
//        return (self % 2) == 0
//    }
//}
//
//5.isEven
//4.isEven
//
////print(array.filter({ ($0 % 2) == 0 }))
////print(array.filter({ ($0 % 2) != 0 }))
//
//// let array = [11, 3, 6, 2, 9]
//func doSomething(value: Int) -> String {
//    return value < 5 ? "less than 5" : "greater than 5"
//}
//
////print(array.map(doSomething))
////print(array.map({ $0 * 2 }))
////
////let array2 = ["hello", "there"] // domain
////print(array2.map({ string in string.uppercased() })) // domain mapped into the range
//
////let optionals: [Int?] = [1, 3, nil, 2, nil, nil, nil, 10]
////print(optionals.compactMap({ $0 }))
////
////let strings = ["1", "3", "hello", "5", "there", "6"]
//////let results1 = strings.map({ string in Int(string) })
//////let results2 = strings.compactMap({ string in Int(string) })
////let results1 = strings.map({ Int($0) })
////let results2 = strings.compactMap({ Int($0) })
////print(results1)
////print(results2)
//
//
//
//// let array = [11, 3, 6, 2, 9]
////print(array.reduce(0, +))
////print(array.reduce(0, { $0 + $1 }))
////print(array.reduce(0, { currentValue, newValue in  currentValue + newValue }))
////print(array.reduce(0, { currentValue, newValue in
////  print("Current value is \(currentValue)")
////  print("Member of the array is \(newValue)")
////  return currentValue + newValue
////}))
//
//// print([3, 2, 4].reduce(0, { $0 * $1 }))
//
//// print(["hello", "there", "world"].reduce("", { $0 + $1 }))
//
//print(["oh", "what", "fun"].reduce(7, { sum, current in
//    print("Our sum starts at \(sum)")
//    print("Our sum ends at \(sum + current.count) for \(current)")
//    return sum + current.count
//}))

