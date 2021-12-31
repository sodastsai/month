@testable import Month
import XCTest

class MonthHashableTests: XCTestCase {
  func testMonthAsDictionaryKey() {
    let dict = [
      Month(.apr, in: 2007): 1000,
      Month(.aug, in: 2007): 2000,
    ]

    XCTAssertEqual(dict[Month(.apr, in: 2007)], 1000)
    XCTAssertNil(dict[Month(.apr, in: 2008)])
  }
}
