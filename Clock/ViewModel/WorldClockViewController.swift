//
//  WorldClockViewController.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-16.
//

import SwiftUI


class WorldClockViewController: ObservableObject{
    @Published var addTimezonePresented: Bool = false
    var timeZones = [TimezoneModel]()
    
    
    init(){
        getPlist(withName: "timezones")
    }
    
    func getPlist(withName name: String)
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let data = FileManager.default.contents(atPath: path)
        {
            if let dict = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [NSDictionary] {
                
                for tz in dict{
                    // Proper error handling maybe append the string to logs or something?
                    guard let abbr = tz["abbr"] as? String else {return}
                    guard let city = tz["city"] as? String else {return}
                    guard let country = tz["country"] as? String else {return}
                    guard let offset = tz["offset"] as? Double else {return}
                    
                    let value = tz["value"] as! String
                    timeZones.append(TimezoneModel(abbr: abbr, city: city, country: country, offset: offset, value: value))
                }
            }
        }
    }
    
}
