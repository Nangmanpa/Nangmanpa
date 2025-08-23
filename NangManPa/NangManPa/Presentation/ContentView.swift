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
    
    @ObservedObject var router = Router<Path>()
    
    // MARK: view
    var body: some View {
        NavigationStack(path: $router.paths) {
            if !isFirst {
                PredictView()
            } else {
                OnboardingView()
                    .navigationDestination(for: Path.self) { path in
                        if path == .predict {
                            PredictView()
                                .navigationBarBackButtonHidden()
                        }
                    }
            }
        }
        .environmentObject(router)
    }
}

#Preview {
    ContentView()
}
