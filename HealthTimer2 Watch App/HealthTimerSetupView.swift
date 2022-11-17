//
//  HealthTimerSetupView.swift
//  HealthTimer2 Watch App
//
//  Created by 윤종훈 on 2022/11/16.
//

import SwiftUI

struct HealthTimerSetupView: View {
    @State var second: Int
    let action: () -> Void
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if second > 0 {
                second -= 1
            } else {
                WKInterfaceDevice.current().play(.click)
                WKInterfaceDevice.current().play(.notification)
                WKInterfaceDevice.current().play(.click)
                timer.invalidate()
            }
        }
    }
    
    var body: some View {
        VStack {
            if second > 0 {
                Text("Remaining").onAppear() { startTimer() }
                Text("\(second)").bold().font(.system(size: 90))
                Text(" sec.")
                Button("Cancel.") {
                    action()
                }.bold().font(.system(size: 20)).foregroundColor(.red)
            } else {
                Button("Done !") {
                    action()
                }.bold().font(.system(size: 50)).foregroundColor(.white)
            }
        }
    }
}

struct HealthTimerSetupView_Previews: PreviewProvider {
    static var previews: some View {
        HealthTimerSetupView(second: 3, action: { })
    }
}

