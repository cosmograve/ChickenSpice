import SwiftUI

enum CustomFont: String {
    case MontserratBold = "Montserrat-Bold"
    case MontserratRegular = "Montserrat-Regular"
    case MontserratSemiBold = "Montserrat-SemiBold"
    case MontserratMedium = "Montserrat-Medium"
}

extension Font {
    static func custom(_ font: CustomFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
