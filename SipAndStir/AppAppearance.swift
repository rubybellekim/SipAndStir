//
//  AppAppearance.swift
//  SipAndStir
//
//  Created by Ruby Kim on 2024-11-21.
//

import SwiftUI

struct AppAppearance {
    // Colors
    static var backgroundColor: Color {
        return Color(.black) // Custom color from assets
    }
    
    static var textColor: Color {
        return Color(.white) // Custom color from assets
    }
    
    // Fonts
    static var mainFont: Font {
        return Font.custom("Charter", size: 16) // Custom font
    }
    
    static var headerFont: Font {
        return Font.custom("Didot", size: 24)
    }
    
    // Example for other UI elements like button colors
    static var buttonBackgroundColor: Color {
        return Color(.black)
    }
}

struct AppAppearanceModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(AppAppearance.textColor) // Text color
            .font(AppAppearance.mainFont) // Font
            .font(AppAppearance.headerFont)
            .background(AppAppearance.backgroundColor) // Background color
    }
}

extension View {
    func applyAppAppearance() -> some View {
        self.modifier(AppAppearanceModifier())
    }
}
