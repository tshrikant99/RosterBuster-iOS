//
//  FlightDutyHeader.swift
//  RosterBusterTest
//
//  Created by shrikant on 14/10/21.
//

import UIKit

class FlightDutyHeader: UITableViewHeaderFooterView {

    
    @IBOutlet weak var flightDutyDay: UILabel!
    
    func setupHeader(flightVM: FlightVM) {
        
        flightDutyDay.text = flightVM.displayDate
    }
}
