//
//  AccidentType.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import Foundation

/// 사고유형
enum AccidentType: String {
    /// 넘어짐
    case fall
    /// 떨어짐
    case fallFromHeight
    // 물체에 맞음
    case struckByObject
    /// 끼임
    case caughtBetween
    /// 부딪힘
    case collision
    /// 절단, 베임
    case cut
}

extension AccidentType {
    /// 한국어 이름
    var name: String {
        switch self {
        case .fall:
            "넘어짐"
        case .fallFromHeight:
            "떨어짐"
        case .struckByObject:
            "물체에 맞음"
        case .caughtBetween:
            "끼임"
        case .collision:
            "부딪힘"
        case .cut:
            "절단, 베임"
        }
    }
    
    /// 한국어 이름으로 초기화
    init?(name: String) {
        switch name {
        case "넘어짐":
            self = .fall
        case "떨어짐":
            self = .fallFromHeight
        case "물체에 맞음":
            self = .struckByObject
        case "끼임":
            self = .caughtBetween
        case "부딪힘":
            self = .collision
        case "절단, 베임":
            self = .cut
        default:
            return nil
        }
    }
    
    // TODO: proof, example, checklist 데이터 입력하기
    var proof: [String] {
        switch self {
        case .fall:
            [
                "넘어짐 근거"
            ]
        case .fallFromHeight:
            [
                "떨어짐 근거"
            ]
        case .struckByObject:
            [
                "물체에 맞음 근거"
            ]
        case .caughtBetween:
            [
                "끼임 근거"
            ]
        case .collision:
            [
                "부딪힘 근거"
            ]
        case .cut:
            [
                "절단, 베임 근거"
            ]
        }
    }

    var example: [String] {
        switch self {
        case .fall:
            [
                "넘어짐 사례"
            ]
        case .fallFromHeight:
            [
                "떨어짐 사례"
            ]
        case .struckByObject:
            [
                "물체에 맞음 사례"
            ]
        case .caughtBetween:
            [
                "끼임 사례"
            ]
        case .collision:
            [
                "부딪힘 사례"
            ]
        case .cut:
            [
                "절단, 베임 사례"
            ]
        }
    }

    var checkList: [String] {
        switch self {
        case .fall:
            [
                "넘어짐 체크리스트1",
                "넘어짐 체크리스트2"
            ]
        case .fallFromHeight:
            [
                "떨어짐 체크리스트1",
                "떨어짐 체크리스트2"
            ]
        case .struckByObject:
            [
                "물체에 맞음 체크리스트1",
                "물체에 맞음 체크리스트2"
            ]
        case .caughtBetween:
            [
                "끼임 체크리스트1",
                "끼임 체크리스트2"
            ]
        case .collision:
            [
                "부딪힘 체크리스트1",
                "부딪힘 체크리스트2"
            ]
        case .cut:
            [
                "절단, 베임 체크리스트1",
                "절단, 베임 체크리스트2"
            ]
        }
    }
}
