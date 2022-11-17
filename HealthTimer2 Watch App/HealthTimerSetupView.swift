//
//  HealthTimerSetupView.swift
//  HealthTimer2 Watch App
//
//  Created by 윤종훈 on 2022/11/16.
//

import SwiftUI

struct HealthTimerSetupView: View {
    @State var second: Int8
    @Binding var didInContentView: Int8
    let done: () -> Void
    
    var body: some View {
        VStack {
            if second > 0 {
                Text("")
                    .onAppear() { startTimer() }
                Text("\(second)")
                    .bold()
                    .font(.system(size: 90))
                    .foregroundColor(.red)
                Text(" sec.")
            } else {
                Text("Done !")
                    .onAppear() {
                        done() // todo
                    }
                    .bold()
                    .font(.system(size: 50))
                    .foregroundColor(.white)
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
