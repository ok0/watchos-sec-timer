//
//  SessionExtend.swift
//  HealthTimer Watch App
//
//  Created by 윤종훈 on 2022/11/17.
//

import SwiftUI

class SessionExtend: NSObject, ObservableObject, WKExtendedRuntimeSessionDelegate {
    static public let shared = SessionExtend()
    private var session = WKExtendedRuntimeSession()
    
    private func isRunningSession() -> Bool {
        return session.state == .running || session.state == .scheduled
    }
    
    func startSession() {
        if isRunningSession() {
            return
        }
        
        session = WKExtendedRuntimeSession()
        session.delegate = self
        session.start(at: Date())
    }
    
    func stopSession() {
        if isRunningSession() {
            session.invalidate()
        }
    }
    
    func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) {
        if reason != .none {
            print("======================================================")
            print("session error occurred!")
            print("reason.rawValue, \(reason.rawValue)")
            print("error.debugDescription, \(error.debugDescription)")
            print("======================================================")
        }
    }
    
    func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) { }
    
    func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) { }
}
