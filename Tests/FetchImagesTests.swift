//
//  FetchImagesTests.swift
//  SwiftUI-DITests
//
//  Created by Daniel Tartaglia on 2/22/24.
//

import XCTest

@testable import SwiftUI_DI

final class FetchImagesTests: XCTestCase {
	func testURL() {
		let sut = FetchImages()
		XCTAssertEqual(
			sut.url.absoluteString,
			"https://gist.githubusercontent.com/maysamsh/bd3b57b4bd9266de24bfc3203fc5f85b/raw/7aab6637578eb2ec8f8cf674189449603c2ee3ef/images-sample.json"
		)
	}
}
