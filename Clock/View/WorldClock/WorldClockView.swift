//
//  WorldClockView.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-16.
//

import SwiftUI

struct WorldClockView: View {
    let columns = [
        GridItem(.adaptive(minimum: 140))
    ]
    var body: some View {
        VStack{
            CurrentDateTimeHeader()
            Divider()
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(0...10, id: \.self) { _ in
                        RoundedClocks()
                    }
                }
                .padding()
            }
            Spacer()
        }
    }
}

struct WorldClockView_Previews: PreviewProvider {
    static var previews: some View {
        WorldClockView()
    }
}
