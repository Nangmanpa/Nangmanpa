//
//  Router.swift
//  NangManPa
//
//  Created by 석민솔 on 8/24/25.
//

import Foundation

final class Router<T: Hashable>: ObservableObject {
    @Published var paths: [T] = []

    func push(_ path: T) {
        paths.append(path)
    }

    func pop() {
        paths.removeLast()
    }

    func backToRoot() {
        paths.removeAll()
    }
}
