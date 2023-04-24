//
//  DetailsPokemonViewControllerDelegate.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 22.04.2023.
//

import UIKit

protocol DetailsPokemonViewControllerDelegate {
    func setImage(image: UIImage)
    func getPokemonEntity(entity: PokemonDetails)
    func showPokemonDetailsAlert(title: String, message: String)
}
