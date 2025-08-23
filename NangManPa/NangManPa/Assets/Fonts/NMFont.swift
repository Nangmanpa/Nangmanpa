//
//  NMFont.swift
//  NangManPa
//
//  Created by 석민솔 on 8/24/25.
//

import Foundation
import SwiftUI

enum NMFont {
    static let pre_semibold_20: Font = .pretendard(size: 20, weight: .semibold)
    static let pre_semibold_22: Font = .pretendard(size: 22, weight: .semibold)
    static let pre_regular_16: Font = .pretendard(size: 16, weight: .regular)
    static let pre_semibold_17: Font = .pretendard(size: 17, weight: .semibold)
    static let pre_regular_15: Font = .pretendard(size: 15, weight: .regular)
    static let pre_semibold_12: Font = .pretendard(size: 12, weight: .semibold)
    static let pre_heavy_27: Font = .pretendard(size: 27, weight: .heavy)
    static let pre_regular_17: Font = .pretendard(size: 17, weight: .regular)
    static let pre_regular_12: Font = .pretendard(size: 12, weight: .regular)
}

#Preview {
    Text("커스텀 폰트는 이렇게 쓰면 됩니다~")
        .font(NMFont.pre_regular_15)
}
