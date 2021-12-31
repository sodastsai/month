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

// MARK: - Strideable & Additive

extension Month: Strideable {
  public func distance(to other: Month) -> Int {
    let monthDistance = other.name.rawValue - name.rawValue
    let yearDistance = other.year - year
    return yearDistance * 12 + monthDistance
  }

  public func advanced(by step: Int) -> Month {
    let newMonthValue = year * 12 + name.rawValue - 1 + step
    guard let newName = Name(rawValue: (newMonthValue % 12) + 1) else {
      fatalError("get invalid RawValue: \(newMonthValue)")
    }
    let newYear = newMonthValue / 12
    return Month(newName, in: newYear)
  }

  static func + (lhs: Self, rhs: Int) -> Self {
    lhs.advanced(by: rhs)
  }

  static func - (lhs: Self, rhs: Int) -> Self {
    lhs + -rhs
  }

  static func += (lhs: inout Self, rhs: Int) {
    lhs = lhs.advanced(by: rhs)
  }

  static func -= (lhs: inout Self, rhs: Int) {
    lhs += -rhs
  }
}

// MARK: - Hashable

extension Month: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(name)
    hasher.combine(year)
  }
}
