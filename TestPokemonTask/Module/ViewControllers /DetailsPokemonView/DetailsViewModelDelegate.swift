//
//  DetailsViewModelDelegate.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 21.04.2023.
//

import UIKit

protocol DetailsViewModelDelegate {
    func setImage(image: UIImage)
    func getPokemonEntity(entity: PokemonDetails)
}
