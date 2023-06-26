//
//  Palette.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import UIKit
import SwiftUI

extension UIColor {
    convenience init(_ hex: String, alpha: CGFloat = 1.0) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") { cString.removeFirst() }

        if cString.count != 6 {
            self.init("ff0000") // return red color for wrong hex input
            return
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }

    var suiColor: Color {
        Color(uiColor: self)
    }
}

public protocol ColorPalette {
    var accentColor: UIColor { get }
}

public struct LightPalette: ColorPalette {
    public var accentColor: UIColor { .white }
}

public struct DarkPalette: ColorPalette {
    public var accentColor: UIColor { .black }
}


public struct Palette: ColorPalette {
    public let dark: ColorPalette
    public let light: ColorPalette

    public static var current = Palette(dark: DarkPalette(), light: LightPalette())

    public var isDarkMode: Bool {
        UIScreen.main.traitCollection.userInterfaceStyle == .dark
    }

    public var accentColor: UIColor {
        dynamicColor(\.accentColor)
    }
    private func dynamicColor(_ path: KeyPath<ColorPalette, UIColor>) -> UIColor {
        guard #available(iOS 13.0, *) else { return light[keyPath: path] }
        return UIColor {
            let palette = $0.userInterfaceStyle == .dark ? dark : light
            return palette[keyPath: path]
        }
    }
}
