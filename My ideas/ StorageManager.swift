//
//  StorageManager.swift
//  My ideas
//
//  Created by Инна Степанова on 05.05.2021.
//

import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "My_ideas")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    private init() {}
    
    func saveIdea(with textIdea: String) -> Void {
        let context = persistentContainer.viewContext
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Idea", in: context) else { return }
        guard let idea = NSManagedObject(entity: entityDescription, insertInto: context) as? Idea else { return }
        idea.newIdea = textIdea
        
        saveContext()
    }
}
