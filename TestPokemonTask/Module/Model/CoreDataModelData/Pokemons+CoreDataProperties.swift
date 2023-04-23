//
//  Pokemons+CoreDataProperties.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 23.04.2023.
//
//

import Foundation
import CoreData


extension Pokemons {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemons> {
        return NSFetchRequest<Pokemons>(entityName: "Pokemons")
    }

    @NSManaged public var name: String?
    @NSManaged public var imageLink: String?
    @NSManaged public var height: String?
    @NSManaged public var weight: String?

}

extension Pokemons : Identifiable {

}
