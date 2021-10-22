//
//  Flight+CoreDataClass.swift
//  RosterBusterTest
//
//  Created by shrikant on 21/10/21.
//
//

import Foundation
import CoreData


public class Flight: NSManagedObject {
    
//    public func encode(to encoder: Encoder) throws {
//    
//    }
//    
//    required convenience public init(from decoder: Decoder) throws {
//            // return the context from the decoder userinfo dictionary
//            guard let contextUserInfoKey = CodingUserInfoKey.context,
//            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
//            let entity = NSEntityDescription.entity(forEntityName: "Flight", in: managedObjectContext)
//            else {
//                fatalError("decode failure")
//            }
//            // Super init of the NSManagedObject
//            self.init(entity: entity, insertInto: managedObjectContext)
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//           
//        }
}

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}
