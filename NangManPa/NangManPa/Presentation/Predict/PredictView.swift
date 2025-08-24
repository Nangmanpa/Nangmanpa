//
//  PredictView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

/// 예측과 정보 보여주는 메인뷰
struct PredictView: View {
    // MARK: Properties
    @StateObject var viewModel = PredictViewModel()
    @State var isLoading: Bool = false

    // MARK: view
    var body: some View {
        VStack {
            if isLoading {
                LoadingView()
            } else {
                VStack(spacing: 0) {
                    PredictHeaderView(accidentType: viewModel.accidentType, viewModel: viewModel)
                    ScrollView {
                        PredictionInfoView(accidentType: viewModel.accidentType)
                        if let accidentType = viewModel.accidentType {
                            ChecklistView(accidentType: accidentType, viewModel: viewModel)
                                .background(.white1)
                        }
                    }
                    .ignoresSafeArea()
                }
                .background(Color(.keyblue).opacity(0.1))
            }
        }
        .task {
            isLoading = true
            defer { isLoading = false }
            await viewModel.loadWeather()
            let _ = viewModel.run()
        }
    }
}

#Preview {
    PredictView()
}
