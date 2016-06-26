import XCTest

@testable import BoilerplateTestSuite

XCTMain([
	testCase(PointTests.allTests),
	testCase(LineTests.allTests),
])
