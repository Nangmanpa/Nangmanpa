//
//  OnboardingView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Image("onboardingImage")
                .padding(.bottom, 65)
            
            Text("공사 현장에서의 예측 불가능한 사고,\nAn-Jeon이 예측해드립니다")
                .font(NMFont.pre_semibold_20)
                .foregroundStyle(Color.text1)
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
            
            Text("공공데이터를 기반으로 학습된 AI 모델을 이용하여\n건설 현장의 조건에 맞게 돌발 상황을 예측해요")
                .font(.pretendard(size: 15, weight: .semibold))
                .foregroundStyle(Color.text2)
            
            Spacer()
            
            NavigationLink {
                InfoInputView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("현장 정보 입력하기")
                    .font(NMFont.pre_semibold_17)
                    .foregroundStyle(Color.white)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundStyle(Color.black01)
                    )
            }
            .padding(.bottom, 54)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    OnboardingView()
}
