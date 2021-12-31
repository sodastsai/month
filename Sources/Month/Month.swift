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
