//
//  StopwatchView.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-15.
//

import SwiftUI

struct StopwatchView: View {
    @StateObject var stopwatchVC = StopwatchViewController()
    
    let columns = [
        GridItem(.adaptive(minimum: 300))
    ]
    var body: some View {
        VStack{
            Text(String(format: "%.2fs", stopwatchVC.secondsElapsed))
                .font(.system(size: 64))
                .fontWeight(.semibold)
                .padding()
            HStack{
                Group{
                    if stopwatchVC.mode == .stopped {
                        
                        StopWatchButton(title: "Reset", color: .red)
                            .onTapGesture {
                                stopwatchVC.reset()
                            }
                    }else{
                        
                        StopWatchButton(title: "Lap", color: .gray)
                            .onTapGesture {
                                stopwatchVC.addLap()
                            }
                    }
                }

                Group{
                    if stopwatchVC.mode == .stopped {
                        StopWatchButton(title: "Start", color: .green)
                            .onTapGesture {
                                stopwatchVC.start()
                            }
                    }else{
                        StopWatchButton(title: "Stop", color: .orange)
                            .onTapGesture {
                                stopwatchVC.stop()
                            }
                    }
                }
            }
            .padding()
            
            Divider()
            
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(stopwatchVC.lappedValues){ lap in
                        LaplineView(lap: lap)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Stopwatch")
        .frame(minWidth: 300)
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}

