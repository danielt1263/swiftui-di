//
//  APIService.swift
//  TDD App
//
//  Created by Maysam Shahsavari on 2023-11-13.
//

import Combine
import Foundation

final class APIService: NetworkingService {
	func request<E>(_ endpoint: E) -> AnyPublisher<E.Response, Error> where E: Endpoint {
		URLSession.shared.dataTaskPublisher(for: endpoint.url)
			.tryMap { try endpoint.response(data: $0.data) }
			.eraseToAnyPublisher()
	}
}
