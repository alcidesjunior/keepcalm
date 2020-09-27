import SwiftUI


enum Style {
    case greeting
    case phrase
    case title

    var formatted: Font {
        switch self {
        case .greeting:
            return Font.system(size: 40, weight: .black, design: .rounded)
        case .phrase:
            return Font.system(size: 20, weight: .medium, design: .rounded)
        case .title:
            return Font.system(size: 26, weight: .medium, design: .rounded)
        }
    }
}

