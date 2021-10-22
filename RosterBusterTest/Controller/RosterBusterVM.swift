//
//  RosterBusterVM.swift
//  RosterBusterTest
//
//  Created by shrikant on 12/10/21.
//

import Foundation
import CoreData

class RosterBusterVM {
    
    var flightDutiesArray: [FlightDuties] = []
    
    
    let flightJson: String =
        """
    [
      {
        "Flightnr": "MX78",
        "Date": "06/05/2020",
        "Aircraft Type": "XYZ",
        "Tail": "9878",
        "Departure": "AMS",
        "Destination": "ALC",
        "Time_Depart": "11:35",
        "Time_Arrive": "14:15",
        "DutyID": "FLT",
        "DutyCode": "FLIGHT",
        "Captain": "Richard Versluis",
        "First Officer": "Jeroen Derwort",
        "Flight Attendant": "Lucy Stone"
      },
      {
        "Flightnr": "MX79",
        "Date": "06/07/2020",
        "Aircraft Type": "ABC",
        "Tail": "9878",
        "Departure": "ALC",
        "Destination": "AMS",
        "Time_Depart": "15:05",
        "Time_Arrive": "17:55",
        "DutyID": "FLT",
        "DutyCode": "FLIGHT",
        "Captain": "Richard Versluis",
        "First Officer": "Jeroen Derwort",
        "Flight Attendant": "Lucy Stone"
      },
      {
        "Flightnr": "MX71",
        "Date": "07/07/2020",
        "Aircraft Type": "748-800E",
        "Tail": "9878",
        "Departure": "AMS",
        "Destination": "OSL",
        "Time_Depart": "15:35",
        "Time_Arrive": "17:20",
        "DutyID": "FLT",
        "DutyCode": "FLIGHT",
        "Captain": "Richard Versluis",
        "First Officer": "Jeroen Derwort",
        "Flight Attendant": "Lucy Stone"
      },
      {
        "Flightnr": "MX72",
        "Date": "07/07/2020",
        "Aircraft Type": "748-800E",
        "Tail": "9878",
        "Departure": "AMS",
        "Destination": "ALC",
        "Time_Depart": "18:05",
        "Time_Arrive": "20:00",
        "DutyID": "FLT",
        "DutyCode": "FLIGHT",
        "Captain": "Richard Versluis",
        "First Officer": "Karl Jenkins",
        "Flight Attendant": "Lucy Stone"
      }
    
    ]
    """
    
    let jsonUrl = "https://rosterbuster.aero/wp-content/uploads/dummy-response.json"
    
    func getFlightDuties(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: jsonUrl) else {
            print("Invalid URL....!")
            completion(false)
            return
        }

        guard let jsonData = try? Data(contentsOf: url) else {
            print("URL parse error....!")
            completion(false)
            return
        }
        
        guard let flightDetails = JsonHelper.getDataFromJson(jsonData: jsonData, to: Fligh.self) else {
            print("json parse error....!")
            return
        }
        
//        guard let flightDetails = JsonHelper.getDataFromJson(jsonString: flightJson, to: Flight.self), flightDetails.isEmpty == false else {
//            print("json parse error....!")
//            completion(false)
//            return
//        }
        
        flightDutiesArray.removeAll()
        
        let flightVMArray = flightDetails.map { flight in
            FlightVM.init(flight: flight)
        }
        
        let groupedFlights = Dictionary(grouping: flightVMArray) { $0.date }.sorted { group1, group2 in
            group1.key < group2.key
        }
        
        for element in groupedFlights {
            flightDutiesArray.append(FlightDuties(date: element.key, flightsArray: element.value))
        }
        
        completion(true)
    }
    
}
