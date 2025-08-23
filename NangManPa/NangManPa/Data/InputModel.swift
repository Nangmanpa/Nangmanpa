//
//  InputModel.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import Foundation

struct InputModel: Codable {
    var date: Date = .init()
    var moneyRange: HowMoneyBig?
    var facilityType: FacilityType?
    var extent: Int?
    var groundFloor: Int?
    var undergroundFloor: Int?
    
    var isValid: Bool {
        guard moneyRange != nil, facilityType != nil, extent != nil, groundFloor != nil, undergroundFloor != nil else {
            return false
        }
        
        return true
    }
}

// MARK: UserDefaults 관련 함수
extension InputModel {
    // UserDefaults에 저장
    func save() {
        if let data = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(data, forKey: "InputModel")
        }
    }
    
    // UserDefaults에서 불러오기
    static func load() -> InputModel? {
        guard let data = UserDefaults.standard.data(forKey: "InputModel"),
              let model = try? JSONDecoder().decode(InputModel.self, from: data) else {
            return nil
        }
        return model
    }
    
    // 삭제
    static func remove() {
        UserDefaults.standard.removeObject(forKey: "InputModel")
    }
}
