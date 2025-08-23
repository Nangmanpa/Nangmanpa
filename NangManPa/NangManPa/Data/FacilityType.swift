//
//  FacilityType.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import Foundation

/// 시설물 종류
enum FacilityType: Int, CaseIterable, Codable {
    /// 공동주택
    case apartment
    /// 공장
    case factory
    /// 업무시설
    case office
    /// 교육연구시설
    case educationResearch
    /// 근린생활시설
    case neighborhoodLife
}

extension FacilityType {
    /// 한국어 이름
    var name: String {
        switch self {
        case .apartment:
            "공동주택"
        case .factory:
            "공장"
        case .office:
            "업무시설"
        case .educationResearch:
            "교육연구시설"
        case .neighborhoodLife:
            "근린생활시설"
        }
    }

}
