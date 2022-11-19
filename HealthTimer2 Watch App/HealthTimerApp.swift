//
//  HealthTimer2App.swift
//  HealthTimer2 Watch App
//
//  Created by 윤종훈 on 2022/11/16.
//

import SwiftUI

@main
struct HealthTimer2_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            HealthTimerView()
//                .onAppear{ SessionExtend.shared.startSession() }
//                .onDisappear{ SessionExtend.shared.stopSession() }
        }
    }
}
