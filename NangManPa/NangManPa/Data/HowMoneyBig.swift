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
            "under ₩10M"
        case .from10To20Million:
            "₩10M – under ₩20M"
        case .from20To40Million:
            "₩20M – under ₩40M"
        case .from40MillionTo100Million:
            "₩40M – under ₩100M"
        case .from100MillionTo200Million:
            "₩100M – under ₩200M"
        case .from200MillionTo300Million:
            "₩200M – under ₩300M"
        case .from300MillionTo500Million:
            "₩300M – under ₩500M"
        case .from500MillionTo1Billion:
            "₩500M – under ₩1B"
        case .from1To2Billion:
            "₩1B – under ₩2B"
        case .from2To5Billion:
            "₩2B – under ₩5B"
        case .from5To10Billion:
            "₩5B – under ₩10B"
        case .from10To15Billion:
            "₩10B – under ₩15B"
        case .from15To20Billion:
            "₩15B – under ₩20B"
        case .from20To30Billion:
            "₩20B – under ₩30B"
        case .from30To50Billion:
            "₩30B – under ₩50B"
        case .from50To100Billion:
            "₩50B – under ₩100B"
        case .over100Billion:
            "₩100B+"
        }
    }
}
