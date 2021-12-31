@testable import Month
import XCTest

class MonthStrideableTests: XCTestCase {
  func testMonthDistance() {
    let april1991 = Month(.apr, in: 1991)
    let june1992 = Month(.jun, in: 1992)
    let july1992 = Month(.jul, in: 1992)
    let august1992 = Month(.aug, in: 1992)
    let may1993 = Month(.may, in: 1993)

    XCTAssertEqual(july1992.distance(to: june1992), -1)
    XCTAssertEqual(july1992.distance(to: july1992), 0)
    XCTAssertEqual(july1992.distance(to: august1992), 1)
    XCTAssertEqual(july1992.distance(to: may1993), 10)
    XCTAssertEqual(july1992.distance(to: april1991), -15)
  }

  func testMonthAdvance() {
    let may2004 = Month(.may, in: 2004)

    XCTAssertEqual(may2004.advanced(by: -8), Month(.sep, in: 2003))
    XCTAssertEqual(may2004.advanced(by: -2), Month(.mar, in: 2004))
    XCTAssertEqual(may2004.advanced(by: 0), Month(.may, in: 2004))
    XCTAssertEqual(may2004.advanced(by: 5), Month(.oct, in: 2004))
    XCTAssertEqual(may2004.advanced(by: 11), Month(.apr, in: 2005))
  }

  func testAddition() {
    let september2018 = Month(.sep, in: 2018)
    var month = Month(.aug, in: 2020)

    XCTAssertEqual(september2018 + 5, Month(.feb, in: 2019))
    XCTAssertEqual(september2018 + -10, Month(.nov, in: 2017))

    month += 12
    XCTAssertEqual(month, Month(.aug, in: 2021))
  }

  func testSubstraction() {
    let november2012 = Month(.nov, in: 2012)
    var month = Month(.dec, in: 2011)

    XCTAssertEqual(november2012 - 5, Month(.jun, in: 2012))
    XCTAssertEqual(november2012 - -10, Month(.sep, in: 2013))

    month -= 12
    XCTAssertEqual(month, Month(.dec, in: 2010))
  }

  func testClosedRange() {
    let monthRange = Month(.apr, in: 2021) ... Month(.mar, in: 2022)

    XCTAssertFalse(monthRange.isEmpty)
    XCTAssertEqual(monthRange.count, 12)
    XCTAssertEqual(monthRange.first, Month(.apr, in: 2021))
    XCTAssertEqual(monthRange.last, Month(.mar, in: 2022))
    XCTAssertTrue(monthRange.contains(Month(.jun, in: 2021)))
    XCTAssertFalse(monthRange.contains(Month(.jun, in: 2020)))
    XCTAssertEqual(monthRange.sorted(), [
      Month(.apr, in: 2021),
      Month(.may, in: 2021),
      Month(.jun, in: 2021),
      Month(.jul, in: 2021),
      Month(.aug, in: 2021),
      Month(.sep, in: 2021),
      Month(.oct, in: 2021),
      Month(.nov, in: 2021),
      Month(.dec, in: 2021),
      Month(.jan, in: 2022),
      Month(.feb, in: 2022),
      Month(.mar, in: 2022),
    ])
  }

  func testHalfOpenRange() {
    let monthRange = Month(.apr, in: 2016) ..< Month(.may, in: 2016)

    XCTAssertFalse(monthRange.isEmpty)
    XCTAssertEqual(monthRange.sorted(), [
      Month(.apr, in: 2016),
    ])
  }
}
