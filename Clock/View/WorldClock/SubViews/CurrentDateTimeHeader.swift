//
//  WorldClockView.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-15.
//

import SwiftUI

struct CurrentDateTimeHeader: View {
    @StateObject var time =  Time()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        Group {
                HStack {
                    VStack(alignment: .leading){
                        Text(time.city)
                            .font(.largeTitle)
                    }
                    Spacer()
                    HStack(alignment: .bottom){
                        Text(time.hourMinute)
                            .font(.system(size: 32))
                            .fontWeight(.semibold)
                        Text(time.amPm.rawValue)
                            .font(.title)
                    }
                    .onReceive(timer) { _ in
                        time.refreshHourMinute()
                    }
                }.padding()
            }        
    }
}

struct CurrentDateTimeHeader_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDateTimeHeader()
    }
}
