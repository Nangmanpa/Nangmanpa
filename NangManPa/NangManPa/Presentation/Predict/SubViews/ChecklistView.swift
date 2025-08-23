//
//  ChecklistView.swift
//  NangManPa
//
//  Created by 석민솔 on 8/23/25.
//

import SwiftUI

/// 체크리스트 서브뷰
struct ChecklistView: View {
    // MARK: Properties
    let accidentType: AccidentType?
    @State private var items: [ChecklistItem]
    
    init(accidentType: AccidentType) {
        self.accidentType = accidentType
        self._items = State(initialValue: accidentType.checkList.map { ChecklistItem(title: $0, isChecked: false) })
    }


    // MARK: view
    var body: some View {
        VStack(alignment: .leading) {
            Text("Safety Accident Prevention Checklist")
                .font(NMFont.pre_semibold_20)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            VStack (spacing: 10){
                ForEach($items) { $item in
                    HStack {
                        Toggle(isOn: $item.isChecked) {
                            Text(item.title)
                                .font(NMFont.pre_regular_17)
                                .foregroundColor(.text1)
                                .frame(maxWidth: .infinity, alignment: .bottomLeading)

                        }
                        .toggleStyle(CheckboxToggleStyle())
                    }
                        Divider()
                            .foregroundColor(.text3)
                }
            }
            .padding(8)
            .padding(.vertical, 8)
            Spacer()
        }
        .padding(20)
        .padding(.top, 5)
    }
}

#Preview {
    ChecklistView(accidentType: .caughtBetween)
}

struct ChecklistItem: Identifiable {
    let id = UUID()
    var title: String
    var isChecked: Bool
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Image(configuration.isOn ? "checkbox_checked" : "checkbox_default")
                .resizable()
                .frame(width: 22, height: 22, alignment: .topLeading)
                .onTapGesture { configuration.isOn.toggle() }
            configuration.label
                .font(NMFont.pre_regular_17)
                .foregroundColor(.text1)
        }
    }
}
