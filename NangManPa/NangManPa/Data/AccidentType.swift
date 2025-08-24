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
    
    /// 영어 이름
    var engName: String {
    switch self {
    case .fall:
        "Fall"
    case .fallFromHeight:
        "Fall from Height"
    case .struckByObject:
        "Struck by Object"
    case .caughtBetween:
        "Caught Between"
    case .collision:
        "Collision"
    case .cut:
        "Cut"
    }
}

    // TODO: proof, example, checklist 데이터 입력하기
    var proof: String {
        switch self {
        case .fall:
            "The construction site is slippery as it got wet from the early morning rain"
        case .fallFromHeight:
            "The construction site is slippery as it got wet from the early morning rain"
        case .struckByObject:
            "Some parts of the safety net securing the stacked materials are damaged"
        case .caughtBetween:
            "No safety fence has been installed within the operating radius of heavy equipment (excavator, crane)"
        case .collision:
            "Due to nighttime work, limited visibility increases the risk of workers colliding"
        case .cut:
            "Unfinished edges of metal plates or rebar may cause cuts on workers’ hands"
        }
    }

    var example: String {
        switch self {
        case .fall:
            "While moving to the lower site after finishing TBM work, slipped on a rain-soaked staircase and sustained a minor collarbone fracture"
        case .fallFromHeight:
            "After completing roof welding work, slipped due to rain and fell from a height of 12 meters"
        case .struckByObject:
            "While trying to use the stacked materials, a material held by hand slipped and fell onto the worker’s leg"
        case .caughtBetween:
            "While removing a bolt stuck between steel beams, the worker’s left foot was caught between two H-beams and resulted in a leg fracture"
        case .collision:
            "During nighttime work, the worker’s left instep was struck by the hook of a perforated scaffold, causing a bruise injury"
        case .cut:
            "While cutting a silicone nozzle for caulking around glass, the worker’s index finger was partially severed"
        }
    }

    var checkList: [String] {
        switch self {
        case .fall:
            [
                "Is the work platform securely fixed?",
                "Is the floor free of materials or obstacles?",
                "Are guardrails and safety lines installed?",
                "Is the worker wearing safety shoes?",
            ]
        case .fallFromHeight:
            [
                "Check if the work platforms and walking surfaces are clean, dry, and free of oil, mud, or debris",
                "Confirm ladders, stairs, and scaffolds are stable, properly secured, and not slippery",
                "Check if anti-slip materials (mats, treads, coatings) are applied on walkways in wet or slippery areas",
                "Ensure guardrails, safety lines, and toe boards are installed where fall risks exist",
                "Confirm workers are wearing proper footwear (safety shoes with anti-slip soles)",
                "Verify that walkways, passageways, and stairs are well lit and unobstructed",
                "Ensure weather conditions (rain, ice, strong winds) are considered, and work is paused if surfaces are unsafe",
                "Check whether warning signs or barriers are placed around areas with high slip or fall risks",
            ]
        case .struckByObject:
            [
                "Check installation of safety nets, lifelines, and protective covers securing tools and materials",
                "Check if restricted access zones (safety lines) are installed below high-rise or scaffold work areas",
                "Confirm that workers are wearing safety helmets (with shock absorption function)",
                "Check if unnecessary materials are stacked on scaffolds or formwork",
                "Confirm work is stopped in high wind or rainy conditions",
            ]
        case .caughtBetween:
            [
                "Check if fences and safety signals are installed to restrict access within heavy equipment operating range",
                "Confirm two-person team work in confined or narrow spaces",
                "Check if safety covers are installed on machine rotating parts, belts, and moving sections",
                "Confirm a signal person is assigned during material handling",
                "Check if safety devices (emergency stop buttons, interlocks, etc.) function properly after inspection or maintenance",
            ]
        case .collision:
            [
                "Check if vehicle/heavy equipment routes are separated from worker walkways",
                "Ensure workers are required to wear high-visibility (fluorescent) vests",
                "Check lighting brightness and visibility in work areas during nighttime operations",
                "Confirm warning alarms and spotters are present when heavy equipment is reversing",
                "Check that corridors and walkways are clear of materials or equipment",
            ]
        case .cut:
            [
                "Check if protective covers, switches, and power cut-off functions of cutting tools (grinders, power saws, etc.) are functioning",
                "Confirm rebar/metal edges are finished with caps or tape",
                "Ensure protective gloves are worn when carrying sharp materials such as glass or steel plates",
                "Check compliance with replacement cycle of dull cutters or saws",
                "Confirm that access to cutting work zones is restricted to authorized personnel only",
            ]
        }
    }

}
