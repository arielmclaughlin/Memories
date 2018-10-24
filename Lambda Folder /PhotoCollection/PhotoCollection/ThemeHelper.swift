import UIKit

//Class to select theme
class ThemeHelper {
    let themePreferenceKey: String = "Theme"
    let userDefaults = UserDefaults.standard
  
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        return userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYellow() {
        return userDefaults.set("Yellow", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        if let themePreference = userDefaults.string(forKey: themePreferenceKey) {
            return themePreference
        } else {
            return nil
        }
    }
    
}
