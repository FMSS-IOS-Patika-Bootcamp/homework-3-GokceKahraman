import Foundation

struct ImageCellViewModel{
    
    var url: String?
}


struct Image: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
