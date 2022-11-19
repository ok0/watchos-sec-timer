//
//  ContentView.swift
//  HealthTimer2 Watch App
//
//  Created by 윤종훈 on 2022/11/16.
//

import SwiftUI

struct HealthTimerViewConstants {
    static let didPrefix = "You Did "
    static let timeModels: [TimeModel] = [
        TimeModel(second: 55),
        TimeModel(second: 90),
        TimeModel(second: 30),
        TimeModel(second: 3)
    ]
}

struct HealthTimerView: View {
    @State var did: Int8 = 0
    
    var body: some View {
        NavigationStack {
            Button(
                "\(HealthTimerViewConstants.didPrefix) \(did) !"
            ) { did = 0 }.foregroundColor(.green)
            
            List {
                ForEach(HealthTimerViewConstants.timeModels) { timeModel in
                   NavigationLink(
                       destination: HealthTimerSetupView(
                           second: timeModel.second,
                           didInContentView: $did,
                           done: { did += 1 } // todo
                       )
                   ) {
                       HealthTimerCellView(timeModel: timeModel)
                   }
               }
           }
        }
    }
}

struct HealthTimerView_Previews: PreviewProvider {
    static var previews: some View {
        HealthTimerView()
    }
}
