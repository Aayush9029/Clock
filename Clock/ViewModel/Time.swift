//
//  Formatter.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-15.
//

import Foundation


class Time: ObservableObject {
    @Published var hourMinute: String = "10:10"
    @Published var amPm: AmPm = .pm
    var timezone: String = "America/Ottawa"
    var city: String = "Ottawa"

    enum AmPm: String{
        case am = "am"
        case pm = "pm"
    }
    
    init(){
        refreshHourMinute()
        refreshAmPm()
        setTz()
        setCity()
    }
    
    
    func refreshHourMinute(){
        hourMinute = Date().getFormattedDate(format: "h:mm")
    }
    
    func refreshAmPm(){
        if (Date().getFormattedDate(format: "a") == "am") {
            amPm = .am
        }else{
            amPm = .pm
        }
    }
    
    func getTimeZone() -> String{
        return TimeZone.current.identifier
    }
    
    func getDate() -> String{
        return Date().getFormattedDate(format: "MM/dd/yyyy")
    }
    
    func setTz(){
        timezone = TimeZone.current.identifier
    }
    
    func setCity(){
        if timezone.split(separator: "/").count == 2{
            let splitCity = String(timezone.split(separator: "/")[1])
            city = splitCity
        }else{
            city = timezone
        }
    }
}
