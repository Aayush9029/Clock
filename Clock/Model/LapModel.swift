//
//  LapModel.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-15.
//

import SwiftUI

struct LapModel: Identifiable, Equatable{
    let id: UUID
    let name: String
    let time: Double
    let color: Color
}


let exampleLaps = [
    LapModel(id: UUID(), name: "Lap 2", time: 0.10, color: .red),
    LapModel(id: UUID(), name: "Lap 3", time: 0.25, color: .purple),
    LapModel(id: UUID(), name: "Lap 4", time: 0.45, color: .green),
    LapModel(id: UUID(), name: "Lap 5", time: 0.55, color: .pink),
    LapModel(id: UUID(), name: "Lap 6", time: 0.66, color: .blue),
    LapModel(id: UUID(), name: "Lap 7", time: 0.8, color: .orange),
]
