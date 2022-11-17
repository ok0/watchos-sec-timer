//
//  TimeModel.swift
//  HealthTimer2 Watch App
//
//  Created by 윤종훈 on 2022/11/16.
//

import Foundation

struct TimeModel: IdentifiableHashTable {
    var id: String { String(second) }
    var name: String { String(second) + " sec." }
    let second: Int8
}
