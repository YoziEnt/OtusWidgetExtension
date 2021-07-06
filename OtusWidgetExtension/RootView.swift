//
//  ContentView.swift
//  OtusWidgetExtension
//
//  Created by Олег Мишкин on 02.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var linkOne: Bool = false
    @State var linkTwo: Bool = false
    @State var linkThree: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: Text("Link1-View"), isActive: $linkOne) {
                    Text("Link1")
                }
                NavigationLink(
                    destination: Text("Link2-View"), isActive: $linkTwo) {
                    Text("Link2")
                }
                NavigationLink(
                    destination: Text("Link3-View"), isActive: $linkThree) {
                    Text("Link3")
                }
            }

            .navigationBarTitle("Links")
            .onOpenURL(perform: { (url) in
                self.linkOne = url == URL(string: "game:///link1")!
                self.linkTwo = url == URL(string: "game:///link2")!
                self.linkThree = url == URL(string: "game:///link3")!
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
