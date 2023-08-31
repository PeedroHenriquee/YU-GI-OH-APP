import Foundation

struct CardImage: Decodable {
    let id: Int
    let image_url: String
    let image_url_small: String
    let image_url_cropped: String
    
    public func returnNormalImageUrl() -> URL {
        return URL(string: image_url)!
    }
    
    public func returnSmallImageUrl() -> URL {
        return URL(string: image_url_small)!
    }
    
    public func returnCroppedImageUrl() -> URL {
        return URL(string: image_url_cropped)!
    }
}
