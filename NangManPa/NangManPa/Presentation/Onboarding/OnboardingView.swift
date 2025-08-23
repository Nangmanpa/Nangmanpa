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
            
            Text("Unpredictable accidents at construction sites\nAn-Jeon predicts them for you")
                .font(NMFont.pre_semibold_20)
                .foregroundStyle(Color.text1)
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
            
            Text("Our AI model, trained on public data, forecasts potential incidents \nbased on the specific conditions\nof your construction site.")
                .font(.pretendard(size: 15, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.text2)
            
            Spacer()
            
            NavigationLink {
                InfoInputView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Enter Site Information")
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
