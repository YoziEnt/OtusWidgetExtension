//
//  StatisticsScreen.swift
//  OtusWidgetExtension
//
//  Created by Олег Мишкин on 03.07.2021.
//

import SwiftUI

struct StatisticsScreen: View {
    
    @EnvironmentObject var environment: EnvironmentState
    
    @State private var ascending: Bool = true
    
    @State private var search: String = ""

    var body: some View {
        VStack {
            Text("Statistics Screen").fontWeight(.bold)
            TextField("Search", text: $search)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Picker(selection: $ascending, label: Text("Sorting")) {
                Text("Ascending").tag(true)
                Text("Discending").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            List(suffixes(ascending: ascending, filter: search), id: \.text) { item in
                StatisticsCell(item.text, count: item.count)
            }
        }
    }
    
    func suffixes(ascending: Bool, filter: String) -> [(text: String, count: Int)] {
        var dict: [String : Int] = .init()
        environment.history.forEach { item in
            var buffer = item
            while buffer.count >= 3 {
                let suffix = String(buffer.suffix(3))
                if let _ = dict[suffix] {
                    dict[suffix]! += 1
                } else {
                    dict[suffix] = 1
                }
                buffer = String(buffer.dropLast())
            }
        }
        return dict.reduce(into: [(text: String, count: Int)]()) { array, item in
            array.append((item.key, item.value))
        }.filter { filter.isEmpty ? true : $0.text.contains(filter.lowercased()) }
         .sorted { ascending ? ($0.count > $1.count) : ($0.count < $1.count) }
    }

}

private struct StatisticsCell : View {
    
    let text: String
    
    let count: Int
    
    init(_ text: String, count: Int) {
        self.text = text
        self.count = count
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer().frame(width: 10)
                Text(text)
                Spacer()
                Text("\(count)")
                Spacer()
            }
            Spacer()
        }
    }
    
}
