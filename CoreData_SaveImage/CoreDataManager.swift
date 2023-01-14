//
//  CoreDataManager.swift
//  CoreData_SaveImage
//
//  Created by paige shin on 2023/01/14.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        
        ValueTransformer.setValueTransformer(UIImageTransformer(), forName: NSValueTransformerName("UIImageTransformer"))
        
        self.persistentContainer = NSPersistentContainer(name: "PhotosModel")
        self.persistentContainer.loadPersistentStores { desc, error in
            if let error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
}
