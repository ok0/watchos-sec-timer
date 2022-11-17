//
//  HealthTimerCellView.swift
//  HealthTimer2 Watch App
//
//  Created by 윤종훈 on 2022/11/16.
//

import SwiftUI

struct HealthTimerCellView: View {
    let timeModel: TimeModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(timeModel.name)
        }
        .padding(16)
    }
}
