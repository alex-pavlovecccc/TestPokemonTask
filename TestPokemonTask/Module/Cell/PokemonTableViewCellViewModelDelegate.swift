//
//  PokemonTableViewCellViewModelDelegate.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 19.04.2023.
//

import UIKit

protocol PokemonTableViewCellViewModelDelegate {
    func setupImage(image: UIImage)
    func getPokemonEntity(entity: PokemonDetails)
    func getPokemonEntityWithCoreData(entity: Pokemons)
}
