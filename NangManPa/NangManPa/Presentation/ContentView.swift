//
//  ContentView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    let isFirst: Bool = InputModel.load() == nil
    
    // MARK: view
    var body: some View {
        NavigationStack {
            if !isFirst {
                PredictView()
            } else {
                OnboardingView()
            }
        }
    }
}

#Preview {
    ContentView()
}
