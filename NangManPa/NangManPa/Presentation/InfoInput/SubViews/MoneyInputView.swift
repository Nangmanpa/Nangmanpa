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
    /// 입력할 예산
    @Binding var selectedMoneyRange: HowMoneyBig?
    @State var selectedNumber = 1.0
    
    // MARK: view
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                Circle()
                    .frame(width: 20)
                    .foregroundStyle(Color.keyblue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.bottom, 16)
                
                Text("What is the budget for\nthe ongoing construction project?")
                    .font(NMFont.pre_semibold_22)
                    .multilineTextAlignment(.leading)
                
                Text("Move the slider left or right to adjust the value")
                    .font(NMFont.pre_regular_16)
            }
            .foregroundStyle(.text1)
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            
            Slider(
                value: $selectedNumber,
                in: 1...17,
                step: 1
            )
            .tint(.keyblue)
            .padding(.horizontal, 52.5)
            .padding(.top, 74)
            .padding(.bottom, 28)
            .onChange(of: selectedNumber) { oldValue, newValue in
                selectedMoneyRange = .init(rawValue: Int(newValue))
            }
            
            Text(selectedMoneyRange?.description ?? "")
                .font(NMFont.pre_semibold_20)
                .foregroundStyle(.text1)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 0)
                )
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

#Preview {
    MoneyInputView(selectedMoneyRange: .constant(.from100MillionTo200Million))
}
