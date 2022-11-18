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
            if isWating() {
                Text("\(ContentViewConstants.didPrefix) \(didInContentView + 1)")
                
                Text("")
                    .bold()
                    .onAppear() { start() }
                Text("\(second)")
                    .bold()
                    .font(.system(size: 70))
                    .foregroundColor(.red)
                Text(" sec.")
                    .bold()
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
    
    private func isWating() -> Bool {
        return (second > 0)
    }
    
    private func start() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if isWating() {
                second -= 1
            } else {
                WKInterfaceDevice.current().play(.notification)
                timer.invalidate()
            }
        }
    }
}

struct HealthTimerSetupView_Previews: PreviewProvider {
    @State private static var did: Int8 = 0
    
    static var previews: some View {
        HealthTimerSetupView(
            second: 3,
            didInContentView: $did,
            done: {}
        )
    }
}
