//
//  Endpoint.swift
//  SwiftUI-DI
//
//  Created by Daniel Tartaglia on 2/21/24.
//

import Foundation

protocol Endpoint {
	associatedtype Response
	var url: URL { get }
	func response(data: Data) throws -> Response
}

extension Endpoint where Response: Decodable {
	func response(data: Data) throws -> Response {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		decoder.dateDecodingStrategy = .iso8601
		return try decoder.decode(Response.self, from: data)
	}
}
