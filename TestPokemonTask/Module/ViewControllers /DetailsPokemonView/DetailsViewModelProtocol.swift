//
//  DetailsViewModelProtocol.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 21.04.2023.
//

import Foundation

protocol DetailsViewModelProtocol: NSObject {
    var delegate: DetailsViewModelDelegate? { get set }
    var getPokemonName: String? { get }
    func getPokemonDetailsWith(url: String)
    func getImage()
}
