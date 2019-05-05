//
//  Profile.swift
//  DiveLister
//
//  Created by Bradley Christensen on 5/4/19.
//  Copyright © 2019 Bradley Christensen. All rights reserved.
//

import Foundation

private class Profile {
    
    
/* Account Personal Information */
    
    //Personal info
    var firstName:String
    var lastName:String
    var fullName:String
    var profileType:String
    var birthday:Date = Date()
    
    //Diver numerical identifiers
    var diveMeetsID:String = "0" //May have people sign in using their divemeets ID??
    var aauID:String = "0"
    
    
/* Initializers */
    
    init(firstName:String, lastName:String, profileType:String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = firstName + " " + lastName
        self.profileType = profileType
        
    }
    
    
/* Getters and Setters */
    
    //First Name
    public func getFirstName() -> String {
        return self.firstName
    }
    
    public func setFirstName(firstName:String) {
        self.firstName = firstName
        self.fullName = self.firstName + " " + self.lastName
    }
    
    //Last Name
    public func getLastName() -> String {
        return self.lastName
    }
    
    public func setLastName(lastName:String) {
        self.lastName = lastName
        self.fullName = self.firstName + " " + self.lastName
    }
    
    //Full Name
    public func getFullName() -> String {
        return self.fullName
    }
    
    //Profile Type
    public func getProfileType() -> String {
        return self.profileType
    }
    
    public func setProfileType(profileType:String) -> Bool {
        if (isValidProfileType(profileType: profileType)) {
            self.profileType = profileType
            return true
        }
        return false
    }
    
    //Checks if the profile type is one of the 3 allowed
    func isValidProfileType(profileType: String) -> Bool {
        if (profileType == "Diver" || profileType == "Coach" || profileType == "Parent") {
            return true
        }
        return false
    }
    
    //Birthday
    public func getBirthday() -> Date {
        return self.birthday
    }
    
    public func setBirthday(day:Int, month:Int, year:Int) -> Bool {
        //Create a Date from the 3 entered components
        let birthdayDateComponents = DateComponents(calendar: Calendar.current, timeZone: nil, era: nil, year: year, month: month, day: day, hour: nil, minute: nil, second: nil, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        
        if (birthdayDateComponents.isValidDate) {
            //Save birthday to account as a Date
            self.birthday = birthdayDateComponents.date!
            return true
        }
        
        return false
    }
    
    //returns an age group identifier
    public func getAgeGroup() -> String {
        let currentYear = Calendar.current.component(.year, from: Date())
        let birthdayYear = Calendar.current.component(.year, from: self.birthday)
        let divingAge:Int = currentYear - birthdayYear
        
        //Diving age simply takes into account the year you were born
        switch divingAge {
            case 1..<10: return "1-9"
            case 10..<12: return "10-11"
            case 12..<14: return "12-13"
            case 14..<16: return "14-15"
            case 16..<19: return "16-18"
            case 19...: return "19+"
            default: return ""
        }
    }
    
//Future change?
    //Could store age group IDs in a struct here, and have getAgeGroup return an ageGroupID not a string
    public struct ageGroupID {
        
    }
    
}
