//
//  SideBarView.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-15.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selectedPage: Pages?
    var body: some View {
            List{
                NavigationLink(
                           destination: TimerView(),
                           tag: Pages.timer,
                           selection: $selectedPage,
                           label: {
                               Label("Timer", systemImage: "timer").accentColor(.pink)
                           })
                NavigationLink(
                           destination: CurrentDateTimeHeader(),
                           tag: Pages.worldclock,
                           selection: $selectedPage,
                           label: {
                               Label("World Clock", systemImage: "globe.europe.africa.fill").accentColor(.orange)
                           })
                NavigationLink(
                           destination: StopwatchView(),
                           tag: Pages.stopwatch,
                           selection: $selectedPage,
                           label: {
                               Label("Stopwatch", systemImage: "stopwatch").accentColor(.blue)
                           })
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 180, idealWidth: 180, maxWidth: 180, maxHeight: .infinity)
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(selectedPage: .constant(.worldclock))
    }
}
