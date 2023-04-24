//
//  SavedViewControllerViewModel.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 23.04.2023.
//

import Foundation
import UIKit

final class SavedViewControllerViewModel: NSObject, SavedViewControllerViewModelProtocol {
    
    //MARK: - properties
    var delegate: SavedViewControllerViewModelDelegate? {
        didSet {
            self.getPokemonsWithCoreData()
            
        }
    }
    
    
    var pokemons: [Pokemons]? {
        didSet {
            self.delegate?.reloadData()
        }
    }
    
    //MARK: - Methods 
    func getPokemonsWithCoreData() {
        let request = Pokemons.fetchRequest()
        DispatchQueue.main.async {
            if let result = try? CoreDataService.managedObjectContext.fetch(request) {
                self.pokemons = result
            }
        }
    }
}
