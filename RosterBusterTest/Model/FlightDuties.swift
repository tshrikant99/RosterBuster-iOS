//
//  Flight.swift
//  RosterBusterTest
//
//  Created by shrikant on 12/10/21.
//

import Foundation

enum DutyType: String, Decodable {
    case flight = "FLIGHT"
    case off = "OFF"
    case standby = "Standby"
    case layover = "LAYOVER"
    case positioning = "POSITIONING"
}

struct Fligh: Decodable {

    let flightNumber: String
    let date: Date
    let aricraftType: String
    let tail: String
    let from: String
    let to: String
    let departTime: String
    let arrivalTime: String
    let dutyId: String
    let dutyCode: DutyType
    let captain: String
    let firstOfficer: String
    let firstAttendant: String

    enum CodingKeys : String, CodingKey {
        case flightNumber = "Flightnr"
        case date = "Date"
        case aricraftType = "Aircraft Type"
        case tail = "Tail"
        case from = "Departure"
        case to = "Destination"
        case departTime = "Time_Depart"
        case arrivalTime = "Time_Arrive"
        case dutyId = "DutyID"
        case dutyCode = "DutyCode"
        case captain = "Captain"
        case firstOfficer = "First Officer"
        case firstAttendant = "Flight Attendant"
    }
}

struct FlightDuties {
    let date: Date
    let flightsArray: [FlightVM]
}

