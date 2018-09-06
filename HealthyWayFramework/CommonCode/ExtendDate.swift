//
//  ExtendDate.swift
//  HealthyWayAdmin
//
//  Created by Bill Weatherwax on 8/25/18.
//  Copyright © 2018 waxcruz. All rights reserved.
//

import Foundation

extension Date {
    
    public func makeShortStringDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        return dateFormatter.string(from: self)
    }
    
    public func makeShortDisplayStringDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        return dateFormatter.string(from: self)
    }
    
    public func makeMonthSlashDayDisplayString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        return dateFormatter.string(from: self)
    }
        
    public func makeYearStringFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        let year = dateFormatter.string(from: self)
        return year
    }
    
}
