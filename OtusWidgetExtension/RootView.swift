//
//  ContentView.swift
//  OtusWidgetExtension
//
//  Created by Олег Мишкин on 02.07.2021.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var environmentState: EnvironmentState = .init()
    
    var body: some View {
        BottomBar()
            .environmentObject(environmentState)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(EnvironmentState())
    }
}
