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
            Text(viewModel.weather?.condition ?? "")
        }
        .overlay {
            if isLoading {
                ZStack {
                    ProgressView()
                        .scaleEffect(1.4)
                }
            }
        }
        .task {
            isLoading = true
            defer { isLoading = false }
            await viewModel.loadWeather()
        }
    }
}

#Preview {
    PredictView()
}
