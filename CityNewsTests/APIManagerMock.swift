//
//  APIManagerMock.swift
//  CityNewsTests
//
//  Created by Mallikarjuna on 25/06/2023.
//

import XCTest
@testable import CityNews

final class APIManagerMock: APIManagerType {
    
    func request<T>(_ target: TargetType, completion: @escaping (Envelope<T>) -> Void) where T : Decodable {
        switch target.method {
        case .get:
            self.parseData(target.sampleData, completion: completion)
        }
    }

    /// This Method is used to parse(Decode the) the resposne data Implementation
    func parseData<T>(_ responseData: Data?, completion: (Envelope<T>) -> Void) where T : Decodable {
        if let responseData = responseData {
            if let results = try? JSONDecoder().decode(T.self, from: responseData) {
                completion(.success(results))
            } else {
                completion(.failure(APIManagerErrors.decodingError))
            }
        } else {
            completion(.failure(APIManagerErrors.dataNil))
        }
    }
}
