import Foundation

func makePattern(with patternString: String, options: NSRegularExpression.Options = []) -> NSRegularExpression {
  do {
    return try NSRegularExpression(pattern: patternString, options: options)
  } catch {
    fatalError("\(error)")
  }
}

private extension StringProtocol {
  var fullNSRange: NSRange {
    .init(startIndex ..< endIndex, in: self)
  }
}

func parse(
  _ string: String,
  with pattern: NSRegularExpression,
  options: NSRegularExpression.MatchingOptions = [],
  groupNames: [String]
) -> [String: String] {
  guard let match = pattern.firstMatch(in: string, options: options, range: string.fullNSRange) else {
    return [:]
  }
  var result: [String: String] = [:]
  for groupName in groupNames {
    let captureNSRange = match.range(withName: groupName)
    guard captureNSRange.location != NSNotFound,
          let captureRange = Range(captureNSRange, in: string)
    else {
      continue
    }
    result[groupName] = String(string[captureRange])
  }
  return result
}
