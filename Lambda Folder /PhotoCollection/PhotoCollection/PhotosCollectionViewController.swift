import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView?.reloadData()
    }
    
    let photoController: PhotoController
    let themeHelper: ThemeHelper

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
    
                
        // Configure the cell
    
        return cell
    }

    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        if themePreference == "Yellow" {
            collectionView.backgroundColor = UIColor.yellow
            collectionView.backgroundColor = UIColor.darkGray
        }
}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? PhotoDetailViewController {
            detailViewController.photoController = photoController
            detailViewController.themeHelper = themeHelper
            
            if segue.identifier == "PhotoSegue" {
                guard let index = collectionView?.indexPathsForSelectedItems?.first?.item else { return }
                let photo = photoController.photos[index]
                detailViewController.photo = photo
            } else if segue.identifier == "AddPhotoSegue" {
            }
        }
}

}






