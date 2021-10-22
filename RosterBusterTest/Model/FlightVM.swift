//
//  FlightCellVM.swift
//  RosterBusterTest
//
//  Created by shrikant on 14/10/21.
//

import Foundation


struct FlightVM {
    private let flight: Fligh
    
    var date: Date { flight.date }
    
    var displayDate : String { displayDateFormatter.string(from: flight.date)}
    
    var arrival: String { flight.from}
    
    var destination: String { flight.to}
    
    var arrivalDestination : String { (flight.dutyCode == DutyType.off) ? "" : "\(flight.from)-\(flight.to)"}
    
    var departTime: String { flight.departTime }
    
    var arriveTime: String { flight.arrivalTime }
    
    var duty: DutyType { flight.dutyCode }
    
    var matchCrewIsHidden: Bool { (flight.dutyCode == DutyType.standby) ? false : true}
    
    var flightNumber: String { flight.flightNumber }
    
    var aircraftType: String { flight.aricraftType }
    
    var captain: String { flight.captain }
    var firstOfficer: String { flight.firstOfficer }
    var firstAttendant: String { flight.firstAttendant }
    
    init(flight: Fligh) {
        self.flight = flight
    }
}

extension FlightVM {
    var dutyCode: String {
        switch flight.dutyCode {
        case DutyType.flight:
           return "Flight"
        case DutyType.layover:
            return "LAYOVER"
        case DutyType.standby:
            return "StandBy"
        case DutyType.positioning:
            return "Positioning"
        case DutyType.off:
            return "OFF"
        default:
            return ""
        }
    }
    
    var departArriveTime: String {
        switch flight.dutyCode {
        case DutyType.flight:
            return "\(flight.departTime)-\(flight.arrivalTime)"
        case DutyType.layover:
            return "\(timeForLayOver)"
        case DutyType.standby:
            return "\(flight.departTime)-\(flight.arrivalTime)"
        case DutyType.positioning:
            return "\(flight.departTime)-\(flight.arrivalTime)"
        case DutyType.off:
            return ""
        default:
            return ""
        }
        
    }
    
    var timeForLayOver: String {
        var totalTime: String = ""
        guard var totalHoursToGo = Calendar.current.dateComponents([.hour], from: Date(), to: flight.date).hour, totalHoursToGo > 0 else {
            /// if event date is past & difference is less than zero
            return ""
        }
       
        var seperate = flight.departTime.split(separator: ":", maxSplits: 2, omittingEmptySubsequences: true)
        
        guard let extraHours = Int(String(seperate.remove(at: 0))) else {
            return ""
        }
        totalHoursToGo += extraHours
        
        for s in seperate {
            totalTime.append(":\(s)")
        }
        return "\(totalTime) hours"
    }
    
}
