//
//  MoneyInputView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

/// 공사현장의 예산 입력받기 서브뷰
struct MoneyInputView: View {
    // MARK: Properties
    @Binding var selectedMoneyRange: HowMoneyBig?
    
    // MARK: view
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MoneyInputView(selectedMoneyRange: .constant(.from100MillionTo200Million))
}
