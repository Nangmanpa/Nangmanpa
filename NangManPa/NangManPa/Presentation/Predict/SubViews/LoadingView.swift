//
//  LoadingView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

/// 로딩할 때 필요할 수도 있으니까 서브뷰
struct LoadingView: View {
    @State private var currentIndex = 0
    @State private var timer: Timer?

    let imageNames = ["redlight", "yellowlight", "greenlight"]

    var body: some View {
        VStack {
            // 현재 이미지 표시
            Image(imageNames[currentIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110)
                .offset(x: 8, y: 3)
                .background(
                    Color(red: 0.85, green: 0.85, blue: 0.85)
                        .frame(width: 125, height: 125)
                )
                .mask {
                    Circle()
                        .frame(width: 125, height: 125)
                }            
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }

    // 타이머 시작
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0 / 2, repeats: true) {
            _ in
            currentIndex = (currentIndex + 1) % imageNames.count
        }
    }

    // 타이머 정지
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    LoadingView()
}
