//
//  CityNameView.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-16.
//

import SwiftUI

struct CityNameView: View {
    let name: String
    @State var isHovering: Bool = false
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text(name)
                    .font(.title3.bold())
                Spacer()
            }
            .padding()
            .background(isHovering ? Color.blue : Color.black)
            .cornerRadius(5)
            .padding(5)
        }
        .onHover { val in
            withAnimation {
                isHovering = val
            }
        }
    }
}

struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
        CityNameView(name: "Toronto")
    }
}
