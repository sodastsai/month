@testable import Month
import XCTest

final class MonthCustomStringConvertibleTests: XCTestCase {
  func testJanauaryString() {
    XCTAssertEqual("\(Month(.jan, in: 2022))", "1/2022")
  }

  func testFebruaryString() {
    XCTAssertEqual("\(Month(.feb, in: 2021))", "2/2021")
  }

  func testMarchString() {
    XCTAssertEqual("\(Month(.mar, in: 2020))", "3/2020")
  }

  func testAprilString() {
    XCTAssertEqual("\(Month(.apr, in: 2019))", "4/2019")
  }

  func testMayString() {
    XCTAssertEqual("\(Month(.may, in: 2018))", "5/2018")
  }

  func testJuneString() {
    XCTAssertEqual("\(Month(.jun, in: 2017))", "6/2017")
  }

  func testJulyString() {
    XCTAssertEqual("\(Month(.jul, in: 2016))", "7/2016")
  }

  func testAugustString() {
    XCTAssertEqual("\(Month(.aug, in: 2015))", "8/2015")
  }

  func testSeptemberString() {
    XCTAssertEqual("\(Month(.sep, in: 2014))", "9/2014")
  }

  func testOctoberString() {
    XCTAssertEqual("\(Month(.oct, in: 2013))", "10/2013")
  }

  func testNovemberString() {
    XCTAssertEqual("\(Month(.nov, in: 2012))", "11/2012")
  }

  func testDecemberString() {
    XCTAssertEqual("\(Month(.dec, in: 2011))", "12/2011")
  }
}
