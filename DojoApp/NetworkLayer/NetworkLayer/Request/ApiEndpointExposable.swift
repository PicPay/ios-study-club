import Foundation

public protocol ApiEndpointExposable {
    var baseUrl: URL? { get set }
    var schema: HTTPSchema { get set }
    var host: String { get set }
    var path: String { get set }
    var method: HTTPMethod { get set }
    var parameters: [String: Any] { get set }
    var body: Data? { get set }
    var customHeaders: [String: String] { get set }
    var contentType: ContentType { get set }
    var queryItems: [URLQueryItem] { get set }
}

extension ApiEndpointExposable {
    var baseUrl: URL? {
        var components = URLComponents()
        components.scheme = schema.rawValue
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
    
    var schema: HTTPSchema { .https }
    
    var method: HTTPMethod { .get }
    
    var parameters: [String: Any] { [:] }
    
    var body: Data? { nil }
    
    var customHeaders: [String: String] { [:] }
    
    var contentType: ContentType { .applicationJson }
    
    var queryItems: [URLQueryItem] { [] }
}
