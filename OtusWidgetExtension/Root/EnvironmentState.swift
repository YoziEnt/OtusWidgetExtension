//
//  EnvironmentState.swift
//  OtusWidgetExtension
//
//  Created by Олег Мишкин on 03.07.2021.
//

import Combine

final class EnvironmentState : ObservableObject {
    
    @Published var selection: BottomBar.Tab = .input
    
    @Published var history: [String] = .init()
    
}

