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
        ZStack {
            Color(.keyblue).opacity(0.1)
                .ignoresSafeArea()
            VStack(spacing: 16) {
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Predicted Accident Type")
                            .predictionTitleStyle()
                        Text(accidentType?.engName ?? "-")
                            .font(NMFont.pre_heavy_27)
                            .foregroundColor(.keyblue)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        HStack {
                            Text("Probability of Occurrence: 40%")
                                .predictionCaptionStyle()
                            Image(systemName: "info.circle.fill")
                                .predictionCaptionStyle()
                                .onTapGesture {
                                    showPopover.toggle()
                                }
                                .popover(isPresented: $showPopover) {
                                    Text(
                                        "By performing the safety accident prevention checklist below, \nyou can reduce the probability of an accident"
                                    )
                                    .padding(16)
                                    .font(NMFont.pre_regular_12)
                                    .foregroundColor(.text2)
                                    .frame(alignment: .topLeading)
                                    .presentationCompactAdaptation(.popover)
                                    .lineLimit(nil)  
                                }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.55)
                    Image(.redlight)
                        .resizable()
                        .scaledToFit()
                }
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
            .padding(.leading, 20)
            .padding(.bottom, 6)
        }
        .padding(0)

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
