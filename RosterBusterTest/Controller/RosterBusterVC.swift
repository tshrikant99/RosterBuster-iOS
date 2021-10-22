//
//  RosterBusterVC.swift
//  RosterBusterTest
//
//  Created by shrikant on 12/10/21.
//

import UIKit

class RosterBusterVC: UIViewController {

    @IBOutlet weak var flightDutiesTableView: UITableView!
    let viewModel: RosterBusterVM = RosterBusterVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        getFlightData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFlightDetails" {
            if let indexPath = flightDutiesTableView.indexPathForSelectedRow {
                let flightDetialsVC = segue.destination as! FlightDutyDetailsVC
                flightDetialsVC.viewModel = .init(flight: viewModel.flightDutiesArray[indexPath.section].flightsArray[indexPath.row])
                
            } else { print("invalid indexpath!!!")}
        }
    }
}

extension RosterBusterVC {
    func setupUI() {
        flightDutiesTableView.register(UINib(nibName: "FlightCell", bundle: nil), forCellReuseIdentifier: "flightCell")
        flightDutiesTableView.register(UINib(nibName: "FlightDutyHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "FlightDutyHeader")
        
        flightDutiesTableView.delegate = self
        flightDutiesTableView.dataSource = self
    }
    
    func getFlightData() {
        viewModel.getFlightDuties { success in
            if success {
                DispatchQueue.main.async {
                    self.flightDutiesTableView.reloadData()
                }
            }
        }
    }
}


extension RosterBusterVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return viewModel.flightDutiesArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.flightDutiesArray[section].flightsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = flightDutiesTableView.dequeueReusableCell(withIdentifier: "flightCell", for: indexPath) as! FlightCell

        cell.setupCell(flightCellVM: self.viewModel.flightDutiesArray[indexPath.section].flightsArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = flightDutiesTableView.dequeueReusableHeaderFooterView(withIdentifier: "FlightDutyHeader") as! FlightDutyHeader
        
        if let flightVM = viewModel.flightDutiesArray[section].flightsArray.first {
            header.setupHeader(flightVM: flightVM)
        }
        return header
    }
}

extension RosterBusterVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToFlightDetails", sender: self)
    }
}



