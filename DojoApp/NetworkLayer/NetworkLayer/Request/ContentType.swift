import Foundation

public enum ContentType {
    case applicationJson
    case multipartFormData(boundary: String? = nil)
    case textHtml
    
    public var rawValue: String {
        switch self {
        case .applicationJson:
            return "application/json"
        case .multipartFormData(let boundary):
            return "multipart/form-data; boundary=\(String(describing: boundary))"
        case .textHtml:
            return "text/html"
        }
    }
}
