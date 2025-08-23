//
//  ExtentInputView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

/// 공사현장의 면적 입력받기 서브뷰
struct ExtentInputView: View {
    // MARK: Properties
    @Binding var extent: Int?
    @State private var extentText: String = ""
    
    // MARK: view
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                Image("polygon")
                    .foregroundStyle(Color.keyblue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.bottom, 16)
                
                Text("How large is the construction site?")
                    .font(NMFont.pre_semibold_22)
                    .multilineTextAlignment(.leading)
                
                Text("Please enter the area of the construction site as a number only")
                    .font(NMFont.pre_regular_16)
            }
            .foregroundStyle(.text1)
            .padding(.bottom, 10)
            
            HStack {
                TextField("Area of the construction site", text: $extentText)
                    .keyboardType(.numberPad)
                    .font(NMFont.pre_semibold_17)
                
                Text("m²")
                    .font(NMFont.pre_semibold_17)
            }
            .foregroundStyle(.text1)
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
            .padding(.top, 56)
            .onChange(of: extentText) { _, newValue in
                extent = Int(newValue)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ExtentInputView(extent: .constant(nil))
}
