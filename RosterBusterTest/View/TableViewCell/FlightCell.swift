//
//  FlightCell.swift
//  RosterBusterTest
//
//  Created by shrikant on 12/10/21.
//

import UIKit

class FlightCell: UITableViewCell {
    
    @IBOutlet weak var arrivalDestinationLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dutyCodeLabel: UILabel!
    
    @IBOutlet weak var matchCrewLabel: UILabel!
    
    @IBOutlet weak var dutyIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(flightCellVM: FlightVM) {
        
        self.timeLabel.text = flightCellVM.departArriveTime
        self.arrivalDestinationLabel.text = flightCellVM.arrivalDestination
        self.matchCrewLabel.isHidden = flightCellVM.matchCrewIsHidden
        self.dutyCodeLabel.text = flightCellVM.dutyCode
    }
}
