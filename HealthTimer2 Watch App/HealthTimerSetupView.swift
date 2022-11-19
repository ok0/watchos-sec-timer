//
//  HealthTimerSetupView.swift
//  HealthTimer2 Watch App
//
//  Created by 윤종훈 on 2022/11/16.
//

import SwiftUI

struct HealthTimerSetupView: View {
    var second: Int8
    @State var remaning: Int8
    @Binding var didInContentView: Int8
    let done: () -> Void
    @State private var timer: Timer?
    
    init (second: Int8, didInContentView: Binding<Int8>, done: @escaping () -> Void) {
        self.second = second
        self.remaning = second
        self._didInContentView = didInContentView
        self.done = done
    }
    
    var body: some View {
        VStack {
            if isFinised() {
                ing()
            } else {
                Text("\(HealthTimerViewConstants.didPrefix) \(didInContentView + 1)")
                    .onAppear{
                        start()
                    }
                
                Text("Rest for \(second) sec.")
                    .bold()
                    .foregroundColor(.red)
                
                Text("\(remaning)")
                    .bold()
                    .font(.system(size: 70))
                    .foregroundColor(.red)
                Text(" sec.")
                    .bold()
            }
        }.onDisappear{ finish() }
    }
    
    private func ing() -> some View {
        Text("Done !")
            .onAppear() {
                done()
            }
            .bold()
            .font(.system(size: 50))
            .foregroundColor(.white)
    }
    
    private func start() {
        SessionExtend.shared.startSession()
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: true
        ) { _ in
            if isFinised() {
                finish()
            } else {
                remaning -= 1
            }
        }
    }
    
    private func isFinised() -> Bool {
        return remaning == 0
    }
    
    func finish() {
        if isFinised() {
            WKInterfaceDevice.current().play(.notification)
        }
        
        timer?.invalidate()
        timer = nil
        
        SessionExtend.shared.stopSession()
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
