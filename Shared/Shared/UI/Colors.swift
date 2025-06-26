import SwiftUI

public extension Color {
    static let theme = ColorTheme()
}

public struct ColorTheme {
    public let accent = Color("Accent")
    public let background = Color("Background")
    public let primaryText = Color("PrimaryText")
    public let secondaryText = Color("SecondaryText")
    public let surface = Color("Surface")
    
    public init() {}
}
