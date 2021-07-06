//
//  BottomBar.swift
//  OtusWidgetExtension
//
//  Created by Олег Мишкин on 03.07.2021.
//

import SwiftUI

struct BottomBar: View {

    @EnvironmentObject var environmentState: EnvironmentState
    
    @State var linkToInput: Bool = false
    @State var linkToStatistics: Bool = false
    
    var body: some View {
        
        TabView(selection: $environmentState.selection) {
            InputScreen().tabItem {
                Image(systemName: "1.circle")
                Text("Input")
            }.tag(Tab.input)
            
            StatisticsScreen().tabItem {
                Image(systemName: "2.circle")
                Text("Statistics")
            }.tag(Tab.statistics)

        }.onOpenURL(perform: { (url) in
            if url == URL(string: "mywidgetapp:///inputlink")! { environmentState.selection = .input }
            if url == URL(string: "mywidgetapp:///statisticslink")! { environmentState.selection = .statistics }
        })
        
    }
    
    enum Tab : String {
        case input
        case statistics
    }
    
}
