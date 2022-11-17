//
//  TimeModel.swift
//  HealthTimer2 Watch App
//
//  Created by 윤종훈 on 2022/11/16.
//

import Foundation

protocol IdentifiableHashTable: Hashable, Identifiable {  }
extension IdentifiableHashTable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct TimeModel: IdentifiableHashTable {
    var id: String { String(second) }
    var name: String { String(second) + " sec." }
    let second: Int
}
