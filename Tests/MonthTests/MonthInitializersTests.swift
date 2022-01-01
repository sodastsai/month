@testable import Month
import XCTest

private extension Month {
  init(byJsonStringOf date: Date) throws {
    let json = """
    {
      "year": \(Calendar.current.component(.year, from: date)),
      "month": \(Calendar.current.component(.month, from: date))
    }
    """
    self = try JSONDecoder().decode(Month.self, from: json.data(using: .utf8) ?? Data())
  }
}

class MonthInitializersTests: XCTestCase {
  func testCurrent() throws {
    let now = Date()
    let currentMonth = Month.current
    XCTAssertEqual(currentMonth, try Month(byJsonStringOf: now))
  }

  func testInitWithDate() throws {
    // Thu May 10 2007 11:25:15 GMT+0000
    let date1 = Date(timeIntervalSince1970: 1_178_796_315)
    XCTAssertEqual(Month(.may, in: 2007), try Month(byJsonStringOf: date1))

    // Tue Jan 01 2013 00:00:00 GMT+0000
    let date2 = Date(timeIntervalSince1970: 1_356_998_400)
    XCTAssertEqual(Month(.jan, in: 2013), try Month(byJsonStringOf: date2))
  }
}
