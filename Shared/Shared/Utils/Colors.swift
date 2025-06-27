import SwiftUI

public extension Color {
    static let theme = ColorTheme()
}

public struct ColorTheme {
    private static var bundle: Bundle {
        class BundleFinder {}
        return Bundle(for: BundleFinder.self)
    }
    
    public let background = Color("BackgroundColor", bundle: Self.bundle)
    public let primaryText = Color("PrimaryTextColor", bundle: Self.bundle)
    public let secondaryText = Color("SecondaryTextColor", bundle: Self.bundle)
    public let accent = Color("AccentColor", bundle: Self.bundle)
    public let surface = Color("Surface", bundle: Self.bundle)

    public init() {}
}
