import Foundation

public enum HTTPStatusCode: Int {
    case ok = 200
    case badRequest = 400
    case unathourized = 401
    case notFound = 404
    case internalServerError = 500
}
