//
//  APIManager.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation

//This Enum to handle the success and failure from server
enum ResponseStatus<T> {
    case success(T)
    case failure(APIManagerErrors)
}

/// Create Envelope type as a shortcut
typealias Envelope<T: Decodable> = ResponseStatus<T>

/// APIManager Type Protocal for the Request
protocol APIManagerType {
    /// Request With Target Type Interface
    func request<T: Decodable>(_ target: TargetType, completion: @escaping (Envelope<T>) -> Void)
    /// This Method is used to parse(Decode the) the resposne data Interface
    func parseData<T>(_ responseData: Data?, completion: (Envelope<T>) -> Void) where T : Decodable
}

extension APIManagerType {
    func request<T: Decodable>(_ target: TargetType, completion: @escaping (Envelope<T>) -> Void) {
        return request(target, completion: completion)
    }

    func parseData<T>(_ responseData: Data?, completion: (Envelope<T>) -> Void) where T : Decodable {
        return parseData(responseData, completion: completion)
    }
}

class APIManager: APIManagerType {
        
    /// Request With Target Type Implementation
    func request<T>(_ target: TargetType, completion: @escaping (Envelope<T>) -> Void) where T : Decodable {
        switch target.method {
        case .get:
            guard let request = performRequest(for: target) else {
                return completion(.failure(APIManagerErrors.invalidURL))
            }
            URLSession.shared.dataTask(with: request) { responseData, response, error in
                self.parseData(responseData, completion: completion)
            }.resume()
        }
    }
    
    // MARK: - Request building
    /// This Method is used to build the Request for the Target
    /// Returns: Request for the Target
    func performRequest(for target: TargetType) -> URLRequest? {
        guard var urlComponents = URLComponents(string: "\(target.baseURL)\(target.path)") else {
            return nil
        }
        
        urlComponents.queryItems = target.params.compactMap({ param -> URLQueryItem in
            return URLQueryItem(name: param.key, value: param.value)
        })
        
        guard let url = urlComponents.url else {
            return nil
        }
        print("request URL", url)
        var urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadRevalidatingCacheData,
                                    timeoutInterval: 30)
        if target.headers.keys.count > 0 {
            target.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        }
        return urlRequest
    }

    /// This Method is used to parse(Decode the) the resposne data Implementation
    func parseData<T>(_ responseData: Data?, completion: (Envelope<T>) -> Void) where T : Decodable {
        if let responseData = responseData {
            if let results = try? JSONDecoder().decode(T.self, from: responseData) {
                print("result", results)
                completion(.success(results))
            } else {
                completion(.failure(APIManagerErrors.decodingError))
            }
        } else {
            completion(.failure(APIManagerErrors.dataNil))
        }
    }
}
