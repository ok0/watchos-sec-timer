//
//  AbstractModel.swift
//  HealthTimer Watch App
//
//  Created by 윤종훈 on 2022/11/17.
//

import Foundation

protocol IdentifiableHashTable: Hashable, Identifiable {  }
extension IdentifiableHashTable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
