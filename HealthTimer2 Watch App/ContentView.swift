//
//  ContentView.swift
//  HealthTimer2 Watch App
//
//  Created by 윤종훈 on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented = false
    @State private var path: [TimeModel] = []
    
    let timeModels: [TimeModel] = [
        TimeModel(second: 60),
        TimeModel(second: 50),
        TimeModel(second: 30),
        TimeModel(second: 10),
        TimeModel(second: 5)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(timeModels) { timeModel in
                    NavigationLink(
                        timeModel.name,
                        destination: HealthTimerSetupView(
                            second: timeModel.second,
                            action: { self.isPresented = false }
                        )
                    )
                }
            }
        }
        
        NavigationStack {
            List {
                ForEach(timeModels) { timeModel in
                    NavigationLink(timeModel.name, destination: HealthTimerSetupView(second: timeModel.second, action: { }))
                }
            }
        }
        
//        NavigationStack {
//            List {
//                ForEach(timeModels) { timeModel in
//                    NavigationLink(destination: HealthTimerSetupView(second: timeModel.second)) {
//                        HealthTimerCellView(timeModel: timeModel)
//                    }
//                }
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

