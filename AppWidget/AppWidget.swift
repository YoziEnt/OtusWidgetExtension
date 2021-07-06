//
//  AppWidget.swift
//  AppWidget
//
//  Created by Олег Мишкин on 02.07.2021.
//

import WidgetKit
import SwiftUI


struct Provider: TimelineProvider {

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entryDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
        let entry = SimpleEntry(date: entryDate)
        let entries: [SimpleEntry] = [entry]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct AppWidgetEntryView : View {
    
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        
        switch family {
        case .systemSmall:
            Text("small widget! try to use another size")
        default:
            VStack{
                Spacer()
                Link(destination: URL(string: "mywidgetapp:///inputlink")!, label: {
                    Text("Input Data")
                }).foregroundColor(.blue)
                Spacer()
                Link(destination: URL(string: "mywidgetapp:///statisticslink")!, label: {
                    Text("Statistics")
                }).foregroundColor(.blue)
                Spacer()
            }
        }
    }
    
}

@main
struct AppWidget: Widget {
    let kind: String = "AppWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            AppWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct AppWidget_Previews: PreviewProvider {
    static var previews: some View {
        AppWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
