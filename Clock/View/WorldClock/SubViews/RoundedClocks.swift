//
//  RoundedClocks.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-16.
//

import SwiftUI
import SwiftClockUI
struct RoundedClocks: View {
    @State private var clockStyle: ClockStyle = .classic
    @StateObject var time =  Time()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        Group {
            VStack {
                ZStack{
                    Circle()
                        .background(Color.gray)
                        .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    ClockView()
                        .environment(\.clockArmColors, ClockArmColors(
                    minute: .blue,
                    hour: .orange
                )).environment(\.clockIndicatorsColor, .black)
                        .frame(width: 100, height: 100)
                }
                .environment(\.clockConfiguration, ClockConfiguration(isMinuteIndicatorsShown: false, isHourIndicatorsShown: false))
                
                HStack(alignment: .bottom, spacing: 2){
                    Text(time.hourMinute)
                        .fontWeight(.semibold)
                    Text(time.amPm.rawValue)
                }
                Text(time.city)
                    .foregroundColor(.gray)

                
            }.padding()
        }
        .padding(5)
        .background(Color.black.opacity(0.6))
        .cornerRadius(20)
        .padding()
        .onReceive(timer) { _ in
            time.refreshHourMinute()
        }
    }
}

struct RoundedClocks_Previews: PreviewProvider {
    static var previews: some View {
        RoundedClocks()
            .frame(width: 140)
            .padding()
    }
}
