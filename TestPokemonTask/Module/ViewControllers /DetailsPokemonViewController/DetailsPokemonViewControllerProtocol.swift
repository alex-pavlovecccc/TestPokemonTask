//
//  DetailsPokemonViewControllerProtocol.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 22.04.2023.
//

import UIKit

protocol DetailsPokemonViewControllerProtocol: NSObject {
    var delegate: DetailsPokemonViewControllerDelegate? { get set }
    var getPokemonName: String? { get }
    func getPokemonDetailsWith(url: String)
    func getImage()
}


