//
//  LaplineView.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-15.
//

import SwiftUI

struct LaplineView: View {
    let lap: LapModel
    
    @State var isHovered: Bool = false
    var body: some View {
        VStack{
            HStack{
                Text(lap.name)
                    .font(.title3)
                    .bold()
                Spacer()
                Text(String(format: "%.2fs", lap.time))
                    .bold()
            }
            .padding(10)
            .foregroundColor(isHovered ? .white : lap.color)
            .background(lap.color.opacity(0.35))
            .cornerRadius(5)
            .clipped()
//            .shadow(color: lap.color.opacity(0.5), radius: 10, x: 0, y: 5)
        }
        .onHover { hovered in
            withAnimation(.easeInOut(duration: 1)) {
                isHovered = hovered
            }
        }
    }
}

struct LaplineView_Previews: PreviewProvider {
    static var previews: some View {
        LaplineView(lap: exampleLaps.first!)
            .padding()
    }
}
