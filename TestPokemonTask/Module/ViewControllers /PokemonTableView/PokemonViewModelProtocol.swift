//
//  PokemonViewModelProtocol.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 18.04.2023.
//

import UIKit

protocol PokemonViewModelProtocol {
    var delegate: PokemonViewModelDelegate? { get set }
    var pokemonEntites: PokemonResult? { get set }
    var getPokemonCount: Int { get }
    func getUrlForDitails(for path: Int) -> String
    func getAllPokemon()
}
