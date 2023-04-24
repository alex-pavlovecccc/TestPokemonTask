//
//  PokemonTableViewCellViewModelProtocol.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 19.04.2023.
//

import UIKit

protocol PokemonTableViewCellViewModelProtocol: NSObject {
    var delegate: PokemonTableViewCellViewModelDelegate? { get set }
    var pokemonEntity: PokemonDetails? { get set }
    func getImage()
    func getImageWithCoreData()
    func getPokemons(entity: Pokemons)
    func getPokemonDetail(with url: String)
}
