//
//  FetchImagesEndpoint.swift
//  SwiftUI-DI
//
//  Created by Daniel Tartaglia on 2/21/24.
//

import Foundation

struct FetchImages: Endpoint {
	typealias Response = SampleImagesResponse
	let url = URL(string: RemoteAssets.images)!
}
