import UIKit

struct BrandButtonColorsProvider {
    private typealias ButtonColor = BrandColor.Button
    
    private let variant: BrandButton.Configuration.Variant
    private let color: BrandButton.Configuration.Color
    
    init(variant: BrandButton.Configuration.Variant, color: BrandButton.Configuration.Color) {
        self.variant = variant
        self.color = color
    }
    
    func defaultBackground() -> UIColor {
        let hexString: String
        switch (variant, color) {
        case (.primary, .green): hexString = ButtonColor.Green.default
        case (.primary, .blue): hexString = ButtonColor.Blue.default
        case (.secondary, _): hexString = ButtonColor.secondaryDefault
        }
        return UIColor(hexString: hexString)
    }
    
    func pressedBackground() -> UIColor {
        let hexString: String
        switch (variant, color) {
        case (.primary, .green): hexString = ButtonColor.Green.primaryPressed
        case (.primary, .blue): hexString = ButtonColor.Blue.primaryPressed
        case (.secondary, .green): hexString =  ButtonColor.Green.secondaryPressed
        case (.secondary, .blue): hexString =  ButtonColor.Blue.secondaryPressed
        }
        return UIColor(hexString: hexString)
    }
    
    func disabledBackground() -> UIColor {
        let hexString: String
        switch variant {
        case .primary: hexString = ButtonColor.disabled
        case .secondary: hexString = ButtonColor.secondaryDefault
        }
        return UIColor(hexString: hexString)
    }
    
    func defaultTitle() -> UIColor {
        let hexString: String
        switch (variant, color) {
        case (.primary, _): hexString = ButtonColor.primaryTitle
        case (.secondary, .green): hexString = ButtonColor.Green.default
        case (.secondary, .blue): hexString = ButtonColor.Blue.default
        }
        return UIColor(hexString: hexString)
    }
    
    func pressedTitle() -> UIColor {
        let hexString: String
        switch (variant, color) {
        case (.primary, _): hexString = ButtonColor.primaryTitle
        case (.secondary, .green): hexString = ButtonColor.Green.primaryPressed
        case (.secondary, .blue): hexString = ButtonColor.Blue.primaryPressed
        }
        return UIColor(hexString: hexString)
    }
    
    func disabledTitle() -> UIColor {
        let hexString: String
        switch variant {
        case .primary: hexString = ButtonColor.primaryTitle
        case .secondary: hexString = ButtonColor.disabled
        }
        return UIColor(hexString: hexString)
    }
    
    func defaultBorder() -> UIColor? {
        let hexString: String?
        switch (variant, color) {
        case (.secondary, .green): hexString = ButtonColor.Green.default
        case (.secondary, .blue): hexString = ButtonColor.Blue.default
        case (.primary, _): hexString = nil
        }
        return hexString.map(UIColor.init(hexString:))
    }
    
    func pressedBorder() -> UIColor? {
        let hexString: String?
        switch (variant, color) {
        case (.secondary, .green): hexString = ButtonColor.Green.primaryPressed
        case (.secondary, .blue): hexString = ButtonColor.Blue.primaryPressed
        case (.primary, _): hexString = nil
        }
        return hexString.map(UIColor.init(hexString:))
    }
    
    func disabledBorder() -> UIColor? {
        let hexString: String?
        switch variant {
        case .secondary: hexString = ButtonColor.disabled
        case .primary: hexString = nil
        }
        return hexString.map(UIColor.init(hexString:))
    }
}
