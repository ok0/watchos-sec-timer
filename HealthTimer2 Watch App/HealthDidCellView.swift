//
//  HealthDidCellView.swift
//  HealthTimer2
//
//  Created by 윤종훈 on 2022/11/17.
//

import SwiftUI

struct HealthDidCellView: View {
    let titlePrefix = "You Did. : "
    let did: Int8
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(titlePrefix)" + "\(did)")
        }
        .padding(10)
    }
}
