//
//  FetchDetailsEndpoint.swift
//  SwiftUI-DI
//
//  Created by Daniel Tartaglia on 2/21/24.
//

import Foundation

struct FetchImageDetails: Endpoint {
	typealias Response = ExtraDataResponse
	let url = URL(string: RemoteAssets.extraData)!
}
