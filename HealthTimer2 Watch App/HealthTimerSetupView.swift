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
                Text("").onAppear() { startTimer() }
                Text("\(second)").bold().font(.system(size: 90))
                Text(" sec.")
                
//                 to-do
//                Button("Cancel.") { cancel() }.bold().font(.system(size: 20)).foregroundColor(.red)
            } else {
//                 to-do
//                Button("Done !") { done() }.bold().font(.system(size: 50)).foregroundColor(.white)
            }
        }
    }
}

struct HealthTimerSetupView_Previews: PreviewProvider {
    @State static var isPresentedPreview = false
    static var previews: some View {
//         to-do
//        HealthTimerSetupView(second: 3, isPresented: $isPresentedPreview, cancel: { }, done: { })
        HealthTimerSetupView(second: 3, cancel: { }, done: { })
    }
}

