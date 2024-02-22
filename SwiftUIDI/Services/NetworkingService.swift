//
//  NetworkingService.swift
//  TDD App
//
//  Created by Maysam Shahsavari on 2023-11-13.
//

import Combine
import Foundation

protocol NetworkingService: AnyObject {
	func request<E>(_ endpoint: E) -> AnyPublisher<E.Response, Error> where E: Endpoint
}
