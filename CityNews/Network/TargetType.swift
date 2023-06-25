//
//  TargetType.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation

/// The protocol used to define the specifications necessary for a Network Targets.
protocol TargetType {

    /// The target's base `URL`.
    var baseURL: String { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: RequestType { get }

    /// Provides stub data for use in testing.
    var sampleData: Data { get }

    /// The headers to be used in the request.
    var headers: [String: String] { get }

    var params: [String: String] { get }
}

/// This is used for the Request Types
enum RequestType: String {
    case get = "GET"
}
