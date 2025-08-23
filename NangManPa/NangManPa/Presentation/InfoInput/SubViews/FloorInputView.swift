//
//  FloorInputView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

/// 공사현장의 층수 입력받기 서브뷰
struct FloorInputView: View {
    // MARK: Properties
    @Binding var groundFloor: Int?
    @Binding var basementFloor: Int?
    
    @State private var groundFloorText: String = ""
    @State private var basementFloorText: String = ""
    
    // MARK: view
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                Rectangle()
                    .frame(width: 15.25305, height: 15.85967)
                    .foregroundStyle(Color.keyblue)
                    .rotationEffect(Angle(degrees: -45))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.bottom, 16)
                
                Text("건축물의 지상 및 지하의 층수가\n어떻게 되나요?")
                    .font(NMFont.pre_semibold_22)
                    .multilineTextAlignment(.leading)
                
                Text("지상의 층수와 지하의 층수를 각각 입력해주세요")
                    .font(NMFont.pre_regular_16)
            }
            .foregroundStyle(.text1)
            .padding(.bottom, 10)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("지상")
                    .font(NMFont.pre_semibold_20)
                    .padding(.bottom, 12)
                
                HStack {
                    TextField("지상 층수", text: $groundFloorText)
                        .keyboardType(.numberPad)
                        .font(NMFont.pre_semibold_17)
                    
                    Text("층")
                        .font(NMFont.pre_semibold_17)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(
                            Color(red: 0.8, green: 0.8, blue: 0.8),
                            lineWidth: 1.5
                        )
                        .fill(.white)
                )
                .padding(.bottom, 16)
                
                Text("지하")
                    .font(NMFont.pre_semibold_20)
                    .padding(.bottom, 12)
                
                HStack {                    
                    TextField("지하 층수", text: $basementFloorText)
                        .keyboardType(.numberPad)
                        .font(NMFont.pre_semibold_17)
                    
                    Text("층")
                        .font(NMFont.pre_semibold_17)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(
                            Color(red: 0.8, green: 0.8, blue: 0.8),
                            lineWidth: 1.5
                        )
                        .fill(.white)
                )
            }
            .foregroundStyle(.text1)
            .padding(.top, 26)
            .onChange(of: groundFloorText) { _, newValue in
                groundFloor = Int(newValue)
            }
            .onChange(of: basementFloorText) { _, newValue in
                basementFloor = Int(newValue)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    FloorInputView(groundFloor: .constant(nil), basementFloor: .constant(nil))
}
