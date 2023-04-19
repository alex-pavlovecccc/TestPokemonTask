//
//  PokemonTableViewCellViewModelProtocol.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 19.04.2023.
//

import UIKit

protocol PokemonTableViewCellViewModelProtocol {
    var delegate: PokemonTableViewCellViewModelDelegate? { get set }
    var pokemonEntity: PokemonDitails? { get set }
    func getPokemonDitail(with url: String)
    func getPokemonName() -> String
    func getPokemonSpriteLink() -> String
    func getImage()
    func cancel() 
}
