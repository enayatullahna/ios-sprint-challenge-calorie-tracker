//
//  CalorieController.swift
//  Calorie Tracker
//
//  Created by Enayatullah Naseri on 2/25/20.
//  Copyright © 2020 Enayatullah Naseri. All rights reserved.
//

import Foundation
import CoreData

// controller
class CalorieController {
    
    // create
    func create(amount: Int, timestamp: Date = Date(),
                context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        _ = Calorie(amount: amount, timestamp: timestamp, context: context)
        context.perform {
            
            do {
                
                try CoreDataStack.shared.save(context: context)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "calorieListUpdate"), object: nil)
            } catch {
                
                print("Unable to save new Calorie: \(error)")
                context.reset()
            }
        }
    }

//    delete
    func delete(calorie: Calorie,
                context: NSManagedObjectContext = CoreDataStack.shared.mainContext,
                completion: @escaping (Error?) -> Void = { _ in }) {
        context.perform {
            do {
                context.delete(calorie)
                try CoreDataStack.shared.save(context: context)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "calorieListUpdate"), object: nil)
            } catch {
                print("Could not save after deleting: \(error)")
                context.reset()
            }
        }
    }
}
