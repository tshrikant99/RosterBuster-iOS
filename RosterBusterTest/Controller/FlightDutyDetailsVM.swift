//
//  FlightDutyDetailsVM.swift
//  RosterBusterTest
//
//  Created by shrikant on 14/10/21.
//

import Foundation

class FlightDutyDetailsVM {
    
    let flight: FlightVM
    
    init(flight: FlightVM) {
        self.flight = flight
    }
    
    var getDutyIconName: String {
        switch flight.duty {
        case .flight:
            return ""
        case .layover:
            return ""
        case .standby:
            return ""
        case .positioning:
            return ""
        case .off:
            return ""
        }
    }
}
