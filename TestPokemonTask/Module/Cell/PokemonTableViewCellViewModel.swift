//
//  PokemonTableViewCellViewModel.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 19.04.2023.
//

import UIKit

class PokemonTableViewCellViewModel: PokemonTableViewCellViewModelProtocol {
   
    //MARK: - properties
    var delegate: PokemonTableViewCellViewModelDelegate?
    var networkService = NetworkingService()
    var pokemonEntity: PokemonDitails? {
        didSet {
            delegate?.test()
        }
    }
    
    //MARK: - Methods
    func getPokemonDitail(with url: String) {
        networkService.getDitailDataWithUrl(url: url) { result in
            switch result {
            case .failure(let error):
                debugPrint(error.localizedDescription)
            case .success(let details):
                self.pokemonEntity = details
            }
        }
    }
    
    func getPokemonName() -> String {
        guard let name = pokemonEntity?.name else { return "" }
        return name
    }
    
    func getPokemonSpriteLink() -> String {
        guard let link = pokemonEntity?.sprites.frontDefault else { return "" }
        return link
    }
    
    func getImage() {
        //
    }
    
    func cancel() {
        //
    }
}

