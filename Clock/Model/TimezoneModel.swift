//
//  TimezoneModel.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-16.
//

import Foundation


struct TimezoneModel: Hashable{
    let abbr : String;
    let city : String;
    let country : String;
    let offset : Double;
    let value : String;
}
