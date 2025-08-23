//
//  UIFont + Ext.swift
//  NangManPa
//
//  Created by 석민솔 on 8/24/25.
//

import Foundation
import SwiftUI

extension Font {
    static func pretendard(size fontSize: CGFloat, weight: UIFont.Weight) -> Font {
        let familyName = "Pretendard"

        var weightString: String
        switch weight {
        case .black:
            weightString = "Black"
        case .bold:
            weightString = "Blod"
        case .heavy:
            weightString = "ExtraBold"
        case .ultraLight:
            weightString = "ExtraLight"
        case .light:
            weightString = "Light"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .semibold:
            weightString = "SemiBold"
        case .thin:
            weightString = "Thin"
        default:
            weightString = "Regular"
        }

        return Font.custom("\(familyName)-\(weightString)", size: fontSize)
    }

}
