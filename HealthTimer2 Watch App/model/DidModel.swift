//
//  DidModel.swift
//  HealthTimer Watch App
//
//  Created by 윤종훈 on 2022/11/17.
//

import Foundation

struct DidModel: IdentifiableHashTable {
    var id: String { String(second) }
    var name: String { String(second) + " sec." }
    var start: Date
    var end: Date
}
