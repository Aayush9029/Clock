//
//  ContentView.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-15.
//

import SwiftUI

enum Pages: String{
    case worldclock = "World Clock"
    case stopwatch  = "Stopwatch"
    case timer      = "Timer"
}

struct ContentView: View {
    
    @State var selection: Pages? = .stopwatch

    var body: some View {
        NavigationView {
            SidebarView(selectedPage: $selection)
            StopwatchView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
