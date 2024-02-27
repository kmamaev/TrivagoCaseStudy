import os
import UIKit

class FontsManager {
    private static let logger = Logger(subsystem: "Design System", category: "FontsManager")
    static let shared = FontsManager()
    
    private init() {}
    
    func brandFont(withSize size: CGFloat) -> UIFont! {
        let fontName = "ProximaNova-Bold"
        if let font = UIFont(name: fontName, size: size) {
            return font
        } else {
            registerFont(forResource: "proximanova_bold", withExtension: "otf")
            return UIFont(name: fontName, size: size)
        }
    }

    private func registerFont(forResource resource: String, withExtension resourceExtension: String) {
        #if SWIFT_PACKAGE
        let bundle = Bundle.module
        #else
        let bundle = Bundle(for: FontsManager.self)
        #endif
        guard let fontURL = bundle.url(forResource: resource, withExtension: resourceExtension),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let font = CGFont(fontDataProvider) else {
            Self.logger.error("Couldn't register a font from resource: \(resource).\(resourceExtension)")
            return
        }
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
        if let error = error {
            Self.logger.error("An error occured while registering a font from resource: \(resource).\(resourceExtension): \(error.takeRetainedValue().localizedDescription)")
        }
    }
}
