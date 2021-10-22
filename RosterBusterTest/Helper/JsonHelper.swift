//
//  JsonHelper.swift
//  RosterBusterTest
//
//  Created by shrikant on 12/10/21.
//

import Foundation

struct JsonHelper {
    
    static func getDataFromJson<T: Decodable>(jsonData: Data , to: T.Type) -> [T]? {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(jsonDateFormatter)
//        decoder.userInfo[]
        guard let arrayOfObjects = try? decoder.decode([T].self, from: jsonData) else {
            print("Error in decode!")
            return nil
        }
        
        return arrayOfObjects
    }
    
    static func getDataFromJson<T: Decodable>(jsonString: String , to: T.Type) -> [T]? {
        
        let data = jsonString.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(jsonDateFormatter)
        
        guard let arrayOfObjects = try? decoder.decode([T].self, from: data) else {
            print("Error in decode!")
            return nil
        }
        
        return arrayOfObjects
    }
}
