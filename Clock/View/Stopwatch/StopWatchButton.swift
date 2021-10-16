//
//  StopWatchButton.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-15.
//

import SwiftUI

struct StopWatchButton: View {
    let title: String
    let color: Color
    let radius: CGFloat = 6
    
    @State var isHovered: Bool = false
    var body: some View {
        Group {
            HStack{
                Spacer()
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(isHovered ? .white: color)
                Spacer()
            }.padding()
            .foregroundColor(color.opacity(isHovered ? 0.5: 0.25))
            .background(color.opacity(isHovered ? 0.5: 0.25))
            .clipShape(RoundedRectangle(cornerRadius: radius))
            .overlay(
                   RoundedRectangle(cornerRadius: radius)
                       .stroke(color, lineWidth: 2)
               )
        }.onHover { h in
            isHovered = h
            
        }
    }
}


struct StopWatchButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            StopWatchButton(title: "Stop", color: .red)
            StopWatchButton(title: "Lap", color: .yellow)
            StopWatchButton(title: "Start", color: .green)
            
        }
    }
}
