//
//  InputScreen.swift
//  OtusWidgetExtension
//
//  Created by Олег Мишкин on 03.07.2021.
//

import SwiftUI

struct InputScreen : View {
    
    @EnvironmentObject var environment: EnvironmentState
    @State var inputString: String = .init()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Input Text Screen").fontWeight(.bold)
            HStack {
                Spacer(minLength: 20)
                TextField("input text here", text: $inputString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Enter") {
                    environment.history.append(inputString.lowercased().replacingOccurrences(of: " ", with: ""))
                    inputString = ""
                }
                Spacer(minLength: 20)
            }
            List(environment.history, id: \.self) { item in
                HistoryCell(item)
            }
            Spacer()
        }
        
    }
    
}

private struct HistoryCell : View {
    
    let text: String
    
    init(_ text: String) { self.text = text }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer().frame(width: 10)
                Text(text)
                Spacer()
            }
            Spacer()
        }
    }
    
}
