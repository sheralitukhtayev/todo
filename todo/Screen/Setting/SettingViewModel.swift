//
//  SettingViewModel.swift
//  TODO_APP
//
//  Created by ithink on 23/06/23.
//

import SwiftUI

final class SettingViewModel: ObservableObject {
    @Published var shouldShowSheetView = false
    var isDarkModeOn: Bool {
        set {
            if newValue {
                ThemeManager.changeTheme(.dark)
            } else {
                ThemeManager.changeTheme(.light)
            }
        }

        get {
            return isAppOnDarkMode()
        }
    }

    var dismiss: (() -> Void)?
}

extension SettingViewModel {
    func buttonTapped() {
        dismiss?()
    }

    func isAppOnDarkMode() -> Bool {
        let theme = ThemeManager.currentTheme()
        return theme == .dark
    }

    func changeTheme() {
        let theme = ThemeManager.currentTheme()
        ThemeManager.changeTheme(theme == .light ? .dark : .light)
    }
}

enum AppTheme: String {
    case light
    case dark
}
struct ThemeManager {
    static func currentTheme() -> AppTheme {
        if UserDefaults.standard.string(forKey: "theme") == "dark" {
            return .dark
        } else {
            return .light
        }
    }

    static func changeTheme(_ theme: AppTheme) {
        UserDefaults.standard.set(theme.rawValue, forKey: "theme")
        switch theme {
        case .light:
            UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .light
        case .dark:
            UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .dark
        }
    }

    static func changeThemeIfNeeded() {
        if UserDefaults.standard.string(forKey: "theme") == "dark" {
            changeTheme(.dark)
        } else {
            changeTheme(.light)
        }
    }
}
