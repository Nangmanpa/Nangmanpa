//
//  PredictionInfoView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

/// 예측 정보를 보여주는 구역 서브뷰
struct PredictHeaderView: View {
    // MARK: Properties
    let accidentType: AccidentType?
    @State var showPopover: Bool = false
    @State var offset: (CGSize, CGSize) = (.zero, .zero)
    @ObservedObject var viewModel: PredictViewModel

    // MARK: view
    var body: some View {

        VStack(spacing: 16) {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 3) {
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
                            .popover(
                                isPresented: $showPopover,
                                attachmentAnchor: .rect(.bounds),
                                arrowEdge: .top
                            ) {
                                Text(
                                    "By performing the safety accident prevention checklist below, \nyou can reduce the probability of an accident"
                                )
                                .font(NMFont.pre_regular_12)
                                .foregroundColor(.text2)
                                .frame(alignment: .topLeading)
                                .presentationCompactAdaptation(.popover)
                                .fixedSize(horizontal: false, vertical: true) // 줄바꿈 후 높이 확장
                                .padding(16)
                                .lineLimit(nil)
                            }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.55)

                if let itemCount = viewModel.itemCount {
                    let ratio =
                        Double(viewModel.checkedCount) / Double(itemCount)

                    Image(
                        ratio < 0.5
                            ? .redlight
                            : (ratio == 1 ? .greenlight : .yellowlight)
                    )
                    .resizable()
                    .scaledToFit()
                    .offset(x: 20)
                }

            }
            .padding(.vertical)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 16)
    }
}

#Preview {
    PredictHeaderView(
        accidentType: .caughtBetween,
        viewModel: PredictViewModel()
    )
}
