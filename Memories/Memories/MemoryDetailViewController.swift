import UIKit
import Photos

class MemoryDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var memoryController : MemoryController?
    var memory: Memory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBAction func photoButton(_ sender: Any)  {
        
    }
    @IBAction func saveButton(_ sender: Any) {
    }
    
    private func updateViews() {
        guard let memory = memory else { return }
        title = memory.title
        textField.text = memory.title
        textField.text = memory.bodyText
        guard let memoryImage = UIImage(data: memory.imageData) else { return }
        imageView.image = memoryImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    private func presentImagePickerController() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        } else { return }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {return}
        imageView.image = image
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch authorizationStatus {
        case .authorized:
            presentImagePickerController()
        default:
            PHPhotoLibrary.requestAuthorization { status in
                if status == .authorized {
                    self.presentImagePickerController()
                }
            }
        }
    }
    
    @IBAction func saveMemory(_ sender: Any) {
        guard let memoryController = memoryController else { return }
        guard let titleText = textField.text,
            let bodyText = textField.text,
            let image = imageView.image,
            let imgData = image.pngData() else { return }
        
        guard let memory = memory else {
            memoryController.createMemory(with: titleText, bodyText: bodyText, imageData: imgData)
            navigationController?.popViewController(animated: true)
            return
        }
        memoryController.update(memory: memory, title: titleText, bodyText: bodyText, imageData: imgData)
        navigationController?.popViewController(animated: true)
    }
}

    


