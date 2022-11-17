//
//  HealthTimerSetupView.swift
//  HealthTimer2 Watch App
//
//  Created by 윤종훈 on 2022/11/16.
//

import SwiftUI

struct HealthTimerSetupView: View {
    @State var second: Int
    let cancel: () -> Void
    let done: () -> Void
    
    var body: some View {
        VStack {
            if second > 0 {
                Text("").onAppear() { startTimer() }
                Text("\(second)").bold().font(.system(size: 90)).foregroundColor(.red)
                Text(" sec.")
//                 to-do
//                Button("Cancel.") { cancel() }.bold().font(.system(size: 20)).foregroundColor(.red)
            } else {
//                 to-do
//                Button("Done !") { done() }.bold().font(.system(size: 50)).foregroundColor(.white)
                Text("Done !").bold().font(.system(size: 50)).foregroundColor(.white)
            }
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if second > 0 {
                second -= 1
            } else {
                WKInterfaceDevice.current().play(.notification)
                timer.invalidate()
            }
        }
    }
}
