//
//  AddNewTimeZone.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-16.
//

import SwiftUI

struct AddNewTimeZone: View {
//    I don't like how this code is organized
//    TODO: FIX THIS MESSY CODE
    @EnvironmentObject var wordlClockVC: WorldClockViewController
    @State private var pickedTimeZone: TimezoneModel = WorldClockViewController().timeZones.first!
    @State var isBackHoverd: Bool = false
    let columns = [
        GridItem(.adaptive(minimum: 180))
    ]
    var body: some View {
        VStack{
            HStack{
                Label("Done", systemImage: "chevron.left")
                    .onHover(perform: { val in
                        isBackHoverd = val
                    })
                    .padding(10)
                    .background(isBackHoverd ? Color.gray.opacity(0.5) : .clear)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation {
                            wordlClockVC.addTimezonePresented.toggle()
                        }
                    }
                Spacer()
                Text("Add a new timezones")
                    .font(.title3.bold())
                Spacer()
            }
            .padding()
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(wordlClockVC.timeZones, id:\.self){ timezone in
                        CityNameView(name: timezone.city)
                            .onTapGesture {
                                print(timezone)
                            }
                    }
                }
                .padding()
            }
        }
        .frame(width: 800, height: 600)
    }
}




struct AddNewTimeZone_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTimeZone()
            .environmentObject(WorldClockViewController())
    }
}
