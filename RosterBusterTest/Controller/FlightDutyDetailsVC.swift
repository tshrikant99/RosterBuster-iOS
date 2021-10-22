//
//  FlightDutyDetailsVC.swift
//  RosterBusterTest
//
//  Created by shrikant on 14/10/21.
//

import UIKit

class FlightDutyDetailsVC: UIViewController {

    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var dutyImage: UIImageView!
    @IBOutlet weak var dutyCodeLabel: UILabel!
    
    @IBOutlet weak var flightNumbers: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var arrivalDestinationLabel: UILabel!
    @IBOutlet weak var aircraftType: UILabel!
    @IBOutlet weak var captainLabel: UILabel!
    @IBOutlet weak var firstOfficerLabel: UILabel!
    @IBOutlet weak var firstAttendantLabel: UILabel!
    
    
    var viewModel: FlightDutyDetailsVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setOtherUI()
    }
    
    func setupUI() {
        
        dateLabel.text = "Date: \(viewModel.flight.displayDate)"
        flightNumbers.text = "Flight number: \(viewModel.flight.flightNumber)"
        
        arrivalDestinationLabel.text = "Arrival: \(viewModel.flight.arrival) | Destination: \(viewModel.flight.destination)"
        timeLabel.text = "Departure: \(viewModel.flight.departTime) | Arrival: \(viewModel.flight.arriveTime)"
        dutyCodeLabel.text = "Duty: \(viewModel.flight.dutyCode)"
        //dutyImage.image = UIImage(named: viewModel.getDutyIconName)
    }
 
    func setOtherUI() {
        aircraftType.text = "Aircraft type: \(viewModel.flight.aircraftType)"
        captainLabel.text = "Captain: \(viewModel.flight.captain)"
        firstOfficerLabel.text = "First Officer: \(viewModel.flight.firstOfficer)"
        firstAttendantLabel.text = "FIrst Attendant: \(viewModel.flight.firstAttendant)"
    }
}
