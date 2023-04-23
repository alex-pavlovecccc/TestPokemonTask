//
//  Pokemons+CoreDataClass.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 23.04.2023.
//
//

import Foundation
import CoreData

@objc(Pokemons)
public class Pokemons: NSManagedObject {
    convenience init?(moc: NSManagedObjectContext){
        if let entity = NSEntityDescription.entity(forEntityName: "Pokemons", in: moc){
            self.init(entity: entity, insertInto: moc)
        } else {
            return nil
        }
    }
}
