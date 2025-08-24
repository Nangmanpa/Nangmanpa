//
//  PredictionInfoView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

/// 예측 정보를 보여주는 구역 서브뷰
struct PredictionInfoView: View {
    // MARK: Properties
    let accidentType: AccidentType?
    @State var showPopover: Bool = false
    @State var offset: (CGSize, CGSize) = (.zero, .zero)

    // MARK: view
    var body: some View {

            VStack(spacing: 16) {

                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Prediction Basis")
                        .predictionTitleStyle()
                    Text(accidentType?.proof ?? "-")
                        .predictionNormalStyle()
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Related Case")
                        .predictionTitleStyle()
                    Text(
                        accidentType?.example ?? "-"
                    )
                    .predictionNormalStyle()
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 26)
    }
}

#Preview {
    PredictionInfoView(accidentType: .caughtBetween)
}

extension View {
    func predictionTitleStyle() -> some View {
        self.font(NMFont.pre_semibold_17)
            .foregroundColor(.text1)
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    func predictionCaptionStyle() -> some View {
        self.font(NMFont.pre_semibold_12)
            .foregroundColor(.text2)
            .frame(alignment: .topLeading)
    }
    func predictionNormalStyle() -> some View {
        self.font(NMFont.pre_regular_17)
            .foregroundColor(.text1)
            .frame(alignment: .topLeading)
    }
}
