// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum B01 {
    /// Today
    internal static let title = L10n.tr("Localizable", "B01.Title")
  }

  internal enum C01 {
    /// ゲーム
    internal static let title = L10n.tr("Localizable", "C01.Title")
  }

  internal enum D01 {
    /// App
    internal static let title = L10n.tr("Localizable", "D01.Title")
  }

  internal enum E01 {
    /// Arcade
    internal static let title = L10n.tr("Localizable", "E01.Title")
  }

  internal enum F01 {
    /// 検索
    internal static let title = L10n.tr("Localizable", "F01.Title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
