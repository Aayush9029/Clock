//
//  StopwatchViewController.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-15.
//

import SwiftUI

enum stopWatchMode {
    case running
    case stopped
    case paused
}

class StopwatchViewController: ObservableObject{
    @Published var lappedValues: [LapModel] = [LapModel]()
    @Published var mode: stopWatchMode = .stopped
    @Published var secondsElapsed: Double = 0.0

    var timer = Timer()
        
    var lapIndex = 0
    var colors: [Color] = [.red, .blue, .green, .orange, .purple, .pink]
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            self.secondsElapsed = self.secondsElapsed + 0.01
        }
    }
    func stop() {
        timer.invalidate()
        mode = .stopped
    }
    
    func reset(){
        secondsElapsed = 0
        stop()
        lapIndex = 0
        lappedValues = []
    }
    
    func addLap(){
        let lap = LapModel(
            id: UUID(),
            name: "Lap \(lapIndex)",
            time: secondsElapsed,
            color: colors[lapIndex % colors.count]
        )
        lappedValues.append(lap)
        lapIndex += 1
    }
    
    func clearLappedValues(){
        lappedValues = []
    }
}
