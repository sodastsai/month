@testable import Month
@testable import MonthArgumentParser
import XCTest

class MonthArgumentParserTests: XCTestCase {
  func testInitByValidString() {
    XCTAssertEqual(Month(argument: "07/1933"), Month(.jul, in: 1933))
    XCTAssertEqual(Month(argument: "12/2021"), Month(.dec, in: 2021))
    XCTAssertEqual(Month(argument: "9/2021"), Month(.sep, in: 2021))

    XCTAssertEqual(Month(argument: "04-1938"), Month(.apr, in: 1938))
    XCTAssertEqual(Month(argument: "11-2011"), Month(.nov, in: 2011))
    XCTAssertEqual(Month(argument: "8-2016"), Month(.aug, in: 2016))

    XCTAssertEqual(Month(argument: "Apr 2015"), Month(.apr, in: 2015))
    XCTAssertEqual(Month(argument: "October 2010"), Month(.oct, in: 2010))
  }

  func testUnknownPattern() {
    XCTAssertNil(Month(argument: "-"))
    XCTAssertThrowsError(try Month(string: "-")) { error in
      guard case let Month.ArgumentParserError.unknownStringFormat(string) = error else {
        XCTFail("Unknown error: \(error)")
        return
      }
      XCTAssertEqual(string, "-")
    }
  }

  func testInvalidMonth() {
    XCTAssertNil(Month(argument: "15/2021"))
    XCTAssertThrowsError(try Month(string: "15/2021")) { error in
      guard case let Month.ArgumentParserError.unknownMonthComponent(string) = error else {
        XCTFail("Unknown error: \(error)")
        return
      }
      XCTAssertEqual(string, "15")
    }
  }
}
