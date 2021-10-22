//
//  Flight+CoreDataProperties.swift
//  RosterBusterTest
//
//  Created by shrikant on 21/10/21.
//
//

import Foundation
import CoreData


extension Flight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Flight> {
        return NSFetchRequest<Flight>(entityName: "Flight")
    }

    @NSManaged public var flightNumber: String?
    @NSManaged public var date: Date?
    @NSManaged public var aricraftType: String?
    @NSManaged public var tail: String?
    @NSManaged public var from: String?
    @NSManaged public var to: String?
    @NSManaged public var departTime: String?
    @NSManaged public var arrivalTime: String?
    @NSManaged public var dutyId: String?
    @NSManaged public var dutyCode: String?
    @NSManaged public var captain: String?
    @NSManaged public var firstOfficer: String?
    @NSManaged public var firstAttendant: String?


}

extension Flight : Identifiable {

}
