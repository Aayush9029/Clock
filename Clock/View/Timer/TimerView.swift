//
//  TimerView.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-15.
//

import SwiftUI

struct TimerView: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    @State var selectedPickerIndex = 0
    
    let availableMinutes = Array(1...59)
    
    var body: some View {
        VStack {
            Text(secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft))
                .font(.system(size: 80))
                .padding(.top, 80)
            Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                .foregroundColor(.red)
                .onTapGesture(perform: {
                    if self.timerManager.timerMode == .initial {
                        self.timerManager.setTimerLength(minutes: self.availableMinutes[self.selectedPickerIndex]*60)
                    }
                    self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                })
            
            if timerManager.timerMode == .paused {
                Image(systemName: "gobackward")
                    .foregroundColor(.green)
                    .font(.largeTitle)
                    .padding(5)
                    .onTapGesture(perform: {
                        self.timerManager.reset()
                    })
                    .padding(.top)

            }
            if timerManager.timerMode == .initial {
                Picker(selection: $selectedPickerIndex, label: Text("")) {
                    ForEach(0 ..< availableMinutes.count) {
                        Text("\(self.availableMinutes[$0]) min")
                    }
                }
                .labelsHidden()
            }
            Spacer()
        }
        .navigationTitle("Timer")
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
