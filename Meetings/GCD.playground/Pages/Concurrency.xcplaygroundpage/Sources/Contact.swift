import Foundation

public struct Contact {
    public let id: Int
    public let name: String
    public let photoURL: String
    
    public init(
        id: Int,
        name: String,
        photoURL: String
    ) {
        self.id = id
        self.name = name
        self.photoURL = photoURL
    }
}
