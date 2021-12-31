@testable import Month
import XCTest

class MonthCodableTests: XCTestCase {
  func testEncodeToJSON() throws {
    let encoder = JSONEncoder()
    let encodedData = try encoder.encode(Month(.feb, in: 2009))
    let encodedString = String(data: encodedData, encoding: .utf8)
    XCTAssertEqual(encodedString, #"{"year":2009,"month":2}"#)
  }

  func testDecodeFromJSON() throws {
    let decoder = JSONDecoder()
    let jsonString = #"{"year":2012,"month":12}"#
    guard let jsonData = jsonString.data(using: .utf8) else {
      XCTFail("Failed to convert JSON String to Data")
      return
    }
    let month = try decoder.decode(Month.self, from: jsonData)
    XCTAssertEqual(month.name, .dec)
    XCTAssertEqual(month.year, 2012)
  }
}
