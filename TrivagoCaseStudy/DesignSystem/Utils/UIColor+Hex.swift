import UIKit

extension UIColor {
    convenience init(hexString: String) {
        var formattedString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if formattedString.hasPrefix("#") {
            formattedString.remove(at: formattedString.startIndex)
        }
        
        guard formattedString.count == 6 else {
            self.init(white: 0, alpha: 1)
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: formattedString).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
