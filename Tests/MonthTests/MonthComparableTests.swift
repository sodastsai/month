@testable import Month
import XCTest

class MonthComparableTests: XCTestCase {
  func testMonthEquatable() {
    XCTAssertEqual(Month(.jul, in: 2022), Month(.jul, in: 2022))
    XCTAssertNotEqual(Month(.jul, in: 2021), Month(.jul, in: 2022))
    XCTAssertNotEqual(Month(.jul, in: 2021), Month(.aug, in: 2021))
    XCTAssertNotEqual(Month(.jul, in: 2021), Month(.aug, in: 2020))
  }

  func testMonthLessThan() {
    XCTAssertLessThan(Month(.jul, in: 2021), Month(.aug, in: 2021))
    XCTAssertLessThan(Month(.jul, in: 2021), Month(.jul, in: 2022))
    XCTAssertLessThan(Month(.jul, in: 2021), Month(.jun, in: 2022))
    XCTAssertLessThanOrEqual(Month(.jul, in: 2021), Month(.jul, in: 2021))
  }

  func testMonthGreaterThan() {
    XCTAssertGreaterThan(Month(.jul, in: 2021), Month(.jun, in: 2021))
    XCTAssertGreaterThan(Month(.jul, in: 2022), Month(.jul, in: 2021))
    XCTAssertGreaterThan(Month(.jul, in: 2022), Month(.aug, in: 2021))
    XCTAssertGreaterThanOrEqual(Month(.jul, in: 2021), Month(.jul, in: 2021))
  }
}
