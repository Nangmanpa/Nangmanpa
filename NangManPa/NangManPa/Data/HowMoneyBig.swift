//
//  HowMoneyBig.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import Foundation

/// 금액범위
enum HowMoneyBig: Int, CaseIterable, Codable {
    case under10Million = 1
    case from10To20Million = 2
    case from20To40Million = 3
    case from40MillionTo100Million = 4
    case from100MillionTo200Million = 5
    case from200MillionTo300Million = 6
    case from300MillionTo500Million = 7
    case from500MillionTo1Billion = 8
    case from1To2Billion = 9
    case from2To5Billion = 10
    case from5To10Billion = 11
    case from10To15Billion = 12
    case from15To20Billion = 13
    case from20To30Billion = 14
    case from30To50Billion = 15
    case from50To100Billion = 16
    case over100Billion = 17
    
    var description: String {
        switch self {
        case .under10Million:
            "1,000만원 미만"
        case .from10To20Million:
            "1,000만 ~ 2,000만원 미만"
        case .from20To40Million:
            "2,000만 ~ 4,000만원 미만"
        case .from40MillionTo100Million:
            "4,000만 ~ 1억원 미만"
        case .from100MillionTo200Million:
            "1억 ~ 2억원 미만"
        case .from200MillionTo300Million:
            "2억 ~ 3억원 미만"
        case .from300MillionTo500Million:
            "3억 ~ 5억원 미만"
        case .from500MillionTo1Billion:
            "5억 ~ 10억원 미만"
        case .from1To2Billion:
            "10억 ~ 20억원 미만"
        case .from2To5Billion:
            "20억 ~ 50억원 미만"
        case .from5To10Billion:
            "50억 ~ 100억원 미만"
        case .from10To15Billion:
            "100억 ~ 150억원 미만"
        case .from15To20Billion:
            "150억 ~ 200억원 미만"
        case .from20To30Billion:
            "200억 ~ 300억원 미만"
        case .from30To50Billion:
            "300억 ~ 500억원 미만"
        case .from50To100Billion:
            "500억 ~ 1,000억원 미만"
        case .over100Billion:
            "1,000억원 이상"
        }
    }
}
