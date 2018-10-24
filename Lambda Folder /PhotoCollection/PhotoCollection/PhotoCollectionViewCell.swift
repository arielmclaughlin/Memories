import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var photo: Photo? {
        didSet{
            updateViews()
        }
    }
    
    
    private func updateViews() {
        guard let photo = photo else { return }
        label.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
    
}
