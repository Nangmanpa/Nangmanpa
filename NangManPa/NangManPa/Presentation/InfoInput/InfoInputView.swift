//
//  InfoInputView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

/// 정보 입력 메인뷰
struct InfoInputView: View {
    // MARK: Properties
    /// 입력페이지 전환용
    @State private var pageOrder: Int = 1
    /// 입력됐는지 확인용 변수
    @State var isEntered: Bool = true
    
    @State var inputData: InputModel = .init(
        moneyRange: .under10Million,
        facilityType: nil,
        extent: nil,
        groundFloor: nil,
        undergroundFloor: nil
    )
    
    // MARK: view
    var body: some View {
        HStack(alignment: .center, spacing: 25) {
            if pageOrder > 1 {
                Button {
                    withAnimation(.easeInOut) {
                        pageOrder -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(.text1)
                }
            }
            
            ProgressView(value: Float(pageOrder) / 4)
                .tint(.keyblue)
        }
        .frame(height: 22)
        .padding(.horizontal, 20)
        .padding(.top, 32)
        .padding(.bottom, 70)
        
        switch pageOrder {
        case 1:
            MoneyInputView(selectedMoneyRange: $inputData.moneyRange)
        case 2:
            TypeInputView(isEntered: $isEntered)
        case 3:
            ExtentInputView(isEntered: $isEntered)
        case 4:
            FloorInputView(isEntered: $isEntered)
        default:
            EmptyView()
        }
        
        Spacer()
        
        Group {
            // 입력할 때는 다음
            if pageOrder < 4 {
                Button {
                    withAnimation(.easeInOut) {
                        pageOrder += 1
                    }
                } label: {
                    Text("다음")
                        .font(NMFont.pre_semibold_17)
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(Color.black01)
                        )
                }
                .disabled(!isEntered)
                
            }
            // 입력 끝나면 사고 예측하기 화면으로 넘기기
            else {
                NavigationLink {
                    PredictView()
                } label: {
                    Text("사고 예측하기")
                }
                
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 95)
    }
}

#Preview {
    InfoInputView()
}
