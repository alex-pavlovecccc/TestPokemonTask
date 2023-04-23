//
//  SavedViewControllerViewModelProtocol.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 23.04.2023.
//

import Foundation

protocol SavedViewControllerViewModelProtocol {
    var delegate: SavedViewControllerViewModelDelegate? { get set }
    var getPokemonsCount: Int? { get }
    var pokemons: [Pokemons]? { get set }
    func getPokemonsWithCoreData()
}
