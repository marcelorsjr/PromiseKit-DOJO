import Foundation
import PromiseKit

protocol APIClient {
    func request<T: Decodable>(_ request: Endpoint)  -> Promise<T>
}

public enum APIError: Error, Equatable {
    case apiError(statusCode: Int?, errorMessage: String)
    case genericError
    
    var localizedDescription: String {
        switch self {
        case .genericError:
            return "Something went wrong... :/ \n We're trying to solve the problem!"
            
        case .apiError(_, let errorMessage):
            return errorMessage
        }
    }
}

class APIClientImpl: APIClient {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession(configuration: URLSessionConfiguration.default)) {
        self.urlSession = urlSession
    }
    
    private func handleResponse<T: Decodable>(_ endpoint: Endpoint, data: Data?, response: URLResponse?) -> Promise<T> {
        return Promise { seal in
            if let response = response as? HTTPURLResponse {
                if let data = data, 200...299 ~= response.statusCode {
                    guard let object: T = try? JSONDecoder().decode(T.self, from: data) else {
                        return seal.reject(APIError.genericError)
                    }

                    seal.fulfill(object)
                } else {
                    seal.reject(APIError.genericError)
                }
            } else {
                seal.reject(APIError.genericError)

            }
        }
    }
    
    func request<T: Decodable>(_ endpoint: Endpoint) -> Promise<T> {
        let request = urlRequest(from: endpoint)
        return firstly {
            self.urlSession.dataTask(.promise, with: request as URLRequest)
        }.then { (data, response) -> Promise<T> in
            self.handleResponse(endpoint, data: data, response: response)
        }
    }
    
    private func urlRequest(from endpoint: Endpoint) -> URLRequest {
        var request = URLRequest(url: endpoint.fullPath)
        request.httpMethod = endpoint.method.rawValue
        
        if let headers = endpoint.headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
}
