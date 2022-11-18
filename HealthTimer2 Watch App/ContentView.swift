//
//  ContentView.swift
//  HealthTimer2 Watch App
//
//  Created by 윤종훈 on 2022/11/16.
//

import SwiftUI

struct ContentViewConstants {
    static let didPrefix = "You Did "
    static let timeModels: [TimeModel] = [
        TimeModel(second: 55),
        TimeModel(second: 90),
        TimeModel(second: 30),
        TimeModel(second: 3)
    ]
}

struct ContentView: View {
    @State private var did: Int8 = 0
    
    init() {
        SessionExtend.shared.startSession()
    }
    
    var body: some View {
        NavigationStack {
            Button(
                "\(ContentViewConstants.didPrefix) \(did) !"
            ) { did = 0 }.foregroundColor(.green)
            
            List {
                ForEach(ContentViewConstants.timeModels) { timeModel in
                    NavigationLink(
                        destination: HealthTimerSetupView(
                            second: timeModel.second,
                            didInContentView: $did,
                            done: { did = did + 1 } // todo
                        )
                    ) {
                        HealthTimerCellView(timeModel: timeModel)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
