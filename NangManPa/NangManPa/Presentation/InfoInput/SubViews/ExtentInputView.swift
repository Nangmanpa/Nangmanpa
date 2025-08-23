//
//  ExtentInputView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

/// 공사현장의 면적 입력받기 서브뷰
struct ExtentInputView: View {
    // MARK: Properties
    /// 입력됐는지 확인용 변수
    @Binding var isEntered: Bool
    
    // MARK: view
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ExtentInputView(isEntered: .constant(true))
}
