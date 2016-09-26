//
//  Date.swift
//  HISwiftExtensions
//
//  Created by Matthew on 6/07/2015.
//  Copyright © 2015 Hilenium Pty Ltd.. All rights reserved.
//

import Foundation

//MARK: - TimeAgo

public extension Date {
    
    /**
     Add seconds to a date
     
     - Parameter seconds: int - the number of seconds to add
     
     - Returns: NSDate
     
     */
    public func addSeconds(_ seconds: Int) -> Date {
        let interval = TimeInterval(seconds)
        return self.addingTimeInterval(interval)
    }
    
    /**
     Converts a date to a string representation (e.g. 1 month ago)
     
     - Parameter numericDates: bool - true returns strings such as "1 day ago" false returns strings such as "Yesterday"
     
     - Returns: String
     
     */
    public func timeAgo(_ numericDates:Bool = true) -> String {
        
        let calendar = Calendar.current
        let unitFlags: NSCalendar.Unit = [NSCalendar.Unit.minute, NSCalendar.Unit.hour, NSCalendar.Unit.day, NSCalendar.Unit.weekOfYear, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.second]
        let now = Date()
        let earliest = (now as NSDate).earlierDate(self)
        let latest = (earliest == now) ? self : now
        
        let components: DateComponents = (calendar as NSCalendar).components(unitFlags, from: earliest, to: latest, options: [])
        
        if let year = components.year {
            if year >= 2 {
                return "\(year) years ago"
            }
            else if year >= 1 {
                return numericDates ? "1 year ago" : "Last year"
            }
        }
        else if let month = components.month {
            if month >= 2 {
                 return "\(month) months ago"
            }
            else if month >= 1 {
                return numericDates ?  "1 month ago" : "Last month"
            }
        }
        else if let week = components.weekOfYear {
            if week >= 2 {
                 return "\(week) weeks ago"
            }
            else if week >= 1  {
                return numericDates ? "1 week ago" : "Last week"
            }
        }
        else if let day = components.day {
            if day >= 2 {
                 return "\(day) days ago"
            }
            else if day >= 1 {
                return numericDates ? "1 day ago" : "Yesterday"
            }
        
        } else if let hour = components.hour {
            if hour >= 2 {
                 "\(hour) hours ago"
            }
            else if hour >= 1 {
                return numericDates ? "1 hour ago" : "An hour ago"
            }
        }
        
        else if let minute = components.minute {
            if minute >= 2 {
                 return "\(minute) minutes ago"
            }
            else if minute >= 1 {
                return numericDates ? "1 minute ago" : "A minute ago"
            }
        } else if let second = components.second, second >= 10 {
            return "\(second) seconds ago"
        }
        
        return "Just now"
    }
}
