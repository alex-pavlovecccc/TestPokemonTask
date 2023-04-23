//
//  PokemonModelData.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 18.04.2023.
//
import Foundation
import UIKit
import CoreData

struct PokemonResult: Codable{
    var results: [PokemonEntity]
}

struct PokemonEntity: Codable {
    var url: String
}

struct PokemonDetails: Codable {
    let height: Int
    let name: String?
    let sprites: Sprites?
    let weight: Int
    let species: PokemonSpecies?
    let types: [PokemonType]?
    
    func addCoreDataPokemon(context: NSManagedObjectContext) {
        guard let pokemon = Pokemons(moc: context) else { return  }
        pokemon.name = name
        pokemon.height = String(height)
        pokemon.weight = String(weight )
        pokemon.imageLink = sprites?.frontDefault ?? ""
    }
}

struct Sprites: Codable {
    let backDefault: String
    let backShiny: String
    let frontDefault: String
    let frontShiny: String
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

struct PokemonSpecies: Codable {
    let name: String
    let url: String
}

struct PokemonType: Codable {
    let type: PokemonSpecies
}
