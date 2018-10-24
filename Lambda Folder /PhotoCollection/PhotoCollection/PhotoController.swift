import Foundation

class PhotoController {
    //Array of Photos with type Photo
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }

//Creates memory

    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.index(of: photo) else { return }
        
        var scratch = photo
        scratch.imageData = imageData
        scratch.title = title
        
        photos.remove(at: index)
        photos.insert(scratch, at: index)
}


}
