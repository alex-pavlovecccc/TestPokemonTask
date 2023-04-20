//
//  PokemonViewModel.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 18.04.2023.
//

import UIKit

class PokemonViewModel: PokemonViewModelProtocol {

    //MARK: - properties
    var delegate: PokemonViewModelDelegate?
    var networkService = NetworkingService()
    
    var pokemonEntites: PokemonResult? {
        didSet {
            delegate?.reloadData()
        }
    }
    
    //MARK: - Conputed properties
    var getPokemonCount: Int {
        get {
            if let count = pokemonEntites?.results.count {
                return count
            } else {
                return 0
            }
        }
    }
    
    //MARK: - methods
    func getUrlForDetails(for path: Int) -> String {
        guard let url = pokemonEntites?.results[path].url else { return "" }
        return url
    }
    
    func getAllPokemon() {
        networkService.getDataWithDataTask { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let list):
                self.pokemonEntites = list
            }
        }
    }
}
