import ArgumentParser
import Foundation
import Month

private let monthPatterns = [
  makePattern(with: #"(?<month>[0-9]{1,2})[/-](?<year>[0-9]{4})"#),
  makePattern(with: #"(?<month>[^ ]+) (?<year>[0-9]{4})"#),
]

extension Month: ExpressibleByArgument {
  public static var argumentParserHelpMessage: String {
    let patterns = monthPatterns.map { $0.pattern }.joined(separator: ", ")
    return "Month in following format: \(patterns)"
  }

  public enum ArgumentParserError: Error {
    case unknownStringFormat(String)
    case unknownMonthComponent(String)
    case unknownYearComponent(String)
  }

  public init?(argument: String) {
    guard let month = try? Month(string: argument) else {
      return nil
    }
    self = month
  }

  public init(string: String) throws {
    for monthPattern in monthPatterns {
      if let month = try Self(string: string, pattern: monthPattern) {
        self = month
        return
      }
    }
    throw ArgumentParserError.unknownStringFormat(string)
  }

  private init?(string: String, pattern: NSRegularExpression) throws {
    let strings = parse(string, with: pattern, groupNames: ["month", "year"])
    guard
      let monthString = strings["month"],
      let yearString = strings["year"]
    else {
      return nil
    }
    guard let month = Month.Name(rawValue: monthString) else {
      throw ArgumentParserError.unknownMonthComponent(monthString)
    }
    guard let year = Int(yearString) else {
      throw ArgumentParserError.unknownYearComponent(yearString)
    }
    self = .init(month, in: year)
  }
}

extension Month.Name {
  init?(rawValue: String) {
    if let monthInt = Int(rawValue), let name = Self(rawValue: monthInt) {
      self = name
    } else if let monthIdx = Calendar.current.shortMonthSymbols.firstIndex(of: rawValue),
              let name = Self(rawValue: monthIdx + 1) {
      self = name
    } else if let monthIdx = Calendar.current.monthSymbols.firstIndex(of: rawValue),
              let name = Self(rawValue: monthIdx + 1) {
      self = name
    } else {
      return nil
    }
  }
}
