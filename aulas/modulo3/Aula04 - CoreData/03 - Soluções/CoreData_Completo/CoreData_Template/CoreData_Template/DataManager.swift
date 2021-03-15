//
//  DataManager.swift
//  CoreData_Template
//
//  Created by Nadilson Santana on 18/07/19.
//  Copyright © 2019 DigitalHouse. All rights reserved.
//

import UIKit
import CoreData

class DataManager: NSObject {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData_Template")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func loadData( completion: ([NSManagedObject]?)->Void ) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        let context = persistentContainer.viewContext
        do {
            let results = try context.fetch(fetchRequest)
            completion(results as? [NSManagedObject])
        }catch{
            print("Deu ruim")
            completion(nil)
        }
    }
    
    func saveInformation(name:String, yearOld:String, completion:(Bool) -> Void) {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Pessoa", in: context)!
        
        let pessoa = NSManagedObject(entity: entity, insertInto: context)
        
        pessoa.setValue(name, forKey: "name")
        pessoa.setValue(yearOld, forKey: "yearOld")
        
        do {
            try context.save()
            completion(true)
        }catch{
            print("deu ruim")
            completion(false)
        }
    }
    
    func deletePerson(name: String, completion: (Bool)-> Void) {
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let result = try context.fetch(fetchRequest)
            let objectToDelete = result.last as? NSManagedObject
            if let object = objectToDelete {
                context.delete(object)
            }
            
            do{
                try context.save()
                completion(true)
            } catch{
                print("Deu Ruim")
                completion(false)
            }
            
            
        }catch{
            print("Deu Ruim")
            completion(false)
        }
    }
    
}















//    func loadData(completion: ([NSManagedObject]?)->Void) {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
//        let context = persistentContainer.viewContext
//        do{
//            let results = try context.fetch(fetchRequest)
//            completion(results as? [NSManagedObject])
//
//        }catch{
//            completion(nil)
//            fatalError("Error is retriving titles items")
//        }
//    }
//
//    func saveName(with name: String, idade: String, completion:(Bool)->Void) {
//        let managedContext = persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "Pessoa", in: managedContext)!
//        let pessoa = NSManagedObject(entity: entity, insertInto: managedContext)
//
//        pessoa.setValue(name, forKey: "nome")
//        pessoa.setValue(idade, forKey: "idade")
//
//        do {
//            try managedContext.save()
//            completion(true)
//        } catch let error as NSError {
//            completion(false)
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//    }







//
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "DH_CoreData")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    func loadData(completion: ([NSManagedObject]?)->Void) {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
//        let context = persistentContainer.viewContext
//        do{
//            let results = try context.fetch(fetchRequest)
//            completion(results as? [NSManagedObject])
//
//        }catch{
//            completion(nil)
//            fatalError("Error is retriving titles items")
//        }
//    }
//
//    func saveName(with name: String, idade: String, completion:(Bool)->Void) {
//        let managedContext = persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "Pessoa", in: managedContext)!
//        let pessoa = NSManagedObject(entity: entity, insertInto: managedContext)
//
//        pessoa.setValue(name, forKey: "nome")
//        pessoa.setValue(idade, forKey: "idade")
//
//        do {
//            try managedContext.save()
//            completion(true)
//        } catch let error as NSError {
//            completion(false)
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//    }
//
//    func deleteProfile(name: String, completion: (Bool)-> Void) {
//        let managedContext = persistentContainer.viewContext
//
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
//        fetchRequest.predicate = NSPredicate(format: "nome == %@", name)
//
//        do
//        {
//            let result = try managedContext.fetch(fetchRequest)
//
//            let objectToDelete = result.first as! NSManagedObject
//            managedContext.delete(objectToDelete)
//
//            do{
//                try managedContext.save()
//                completion(true)
//            }
//            catch
//            {
//                print(error)
//                completion(false)
//            }
//        }
//        catch
//        {
//            completion(false)
//            print(error)
//        }
//    }
//}
