//
//  Calories+Convenience.swift
//  Calorie Tracker
//
//  Created by Enayatullah Naseri on 2/25/20.
//  Copyright © 2020 Enayatullah Naseri. All rights reserved.
//

import Foundation
import CoreData

// core extention
extension Calorie {
    
    // 
    convenience init(amount: Int,
                     timestamp: Date = Date(),
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.amount = Int16(amount)
        self.timestamp = timestamp
        
    }
}
