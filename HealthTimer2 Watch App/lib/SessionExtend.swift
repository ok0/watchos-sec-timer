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
    
    func startSession() {
        if session.state == .running {
            return
        }
        
        session = WKExtendedRuntimeSession()
        session.delegate = self
        session.start(at: Date())
    }
    
    func stopSession() {
        if session.state == .running {
            session.invalidate()
        }
    }
    
    func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) { }
    
    func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) { }
    
    func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) { }
}
