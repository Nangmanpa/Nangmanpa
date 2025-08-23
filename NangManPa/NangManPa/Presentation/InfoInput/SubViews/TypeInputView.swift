//
//  TypeInputView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

/// 공사현장의 분류 입력받기 서브뷰
struct TypeInputView: View {
    // MARK: Properties
    /// 입력할 분류
    @Binding var selectedFacilityType: FacilityType?
    
    // MARK: view
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                Rectangle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.keyblue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.bottom, 16)
                
                Text("공사가 진행중인 건축물의\n소분류가 어떻게 되나요?")
                    .font(NMFont.pre_semibold_22)
                    .multilineTextAlignment(.leading)
                
                Text("해당되는 시설물 소분류를 선택해주세요")
                    .font(NMFont.pre_regular_16)
                    .padding(.bottom, 28)
            }
            .padding(.bottom, 10)
            
            ForEach(FacilityType.allCases, id: \.rawValue) { type in
                Button {
                    selectedFacilityType = type
                } label : {
                    Text(type.name)
                        .font(NMFont.pre_semibold_17)
                        .foregroundStyle(.text1)
                        .padding(.leading, 24)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(
                                    selectedFacilityType == type
                                    ? Color.keyblue
                                    : Color.stroke1,
                                    lineWidth: 1.5
                                )
                                .fill(
                                    selectedFacilityType == type
                                    ? Color.keyblue.opacity(0.1)
                                    : .white1
                                )
                        )
                    
                }
                .padding(.bottom, 8)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    TypeInputView(selectedFacilityType: .constant(.apartment))
}
