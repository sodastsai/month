//

public struct Month {
  public enum Name: Int, RawRepresentable {
    case jan = 1, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
  }

  public let year: Int
  public let name: Name

  public init(_ name: Name, in year: Int) {
    self.name = name
    self.year = year
  }
}

extension Month: CustomStringConvertible {
  public var description: String {
    "\(name.rawValue)/\(year)"
  }
}

// MARK: - Comparable

extension Month.Name: Comparable {
  public static func < (lhs: Month.Name, rhs: Month.Name) -> Bool {
    lhs.rawValue < rhs.rawValue
  }
}

extension Month: Comparable {
  public static func < (lhs: Month, rhs: Month) -> Bool {
    if lhs.year == rhs.year {
      return lhs.name < rhs.name
    }
    return lhs.year < rhs.year
  }
}
