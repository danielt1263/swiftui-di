//
//  MockAPIService.swift
//  DI UnitTest
//
//  Created by Maysam Shahsavari on 2023-12-10.
//

import Combine
import Foundation
@testable import SwiftUI_DI

final class MockAPIService: NetworkingService {
	private let contentFile: String
	private var isSuccessful: Bool
	private let jsonDecoder: JSONDecoder

	init(contentFile: String, isSuccessful: Bool, jsonDecoder: JSONDecoder) {
		self.contentFile = contentFile
		self.isSuccessful = isSuccessful
		self.jsonDecoder = jsonDecoder
	}

	func request<E>(_ endpoint: E) -> AnyPublisher<E.Response, Error>
		where E: Endpoint
	{
		guard isSuccessful else {
			return Fail(error: NetworkingError.testing).eraseToAnyPublisher()
		}
		do {
			guard let data = try StubReader.readJson(contentFile) else {
				return Fail(error: FileError.badData).eraseToAnyPublisher()
			}
			return try Result.Publisher(endpoint.response(data: data)).eraseToAnyPublisher()
		}
		catch {
			return Fail(error: error).eraseToAnyPublisher()
		}
	}
}
