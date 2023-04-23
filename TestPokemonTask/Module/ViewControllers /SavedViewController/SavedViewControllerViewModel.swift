//
//  SavedViewControllerViewModel.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 23.04.2023.
//

import Foundation

final class SavedViewControllerViewModel: NSObject, SavedViewControllerViewModelProtocol {
    
    //MARK: - Properties
    var delegate: SavedViewControllerViewModelDelegate? {
        didSet {
            self.getPokemonsWithCoreData()
        }
    }
    
    var getPokemonsCount: Int?
    
    var pokemons: [Pokemons]?
    
    //MARK: - method
    func getPokemonsWithCoreData() {
        
    }
}
