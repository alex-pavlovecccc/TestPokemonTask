//
//  PokemonTableViewCellViewModel.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 19.04.2023.
//

import UIKit

class PokemonTableViewCellViewModel: NSObject, PokemonTableViewCellViewModelProtocol {
   
    //MARK: - properties
    var delegate: PokemonTableViewCellViewModelDelegate?
    private var networkService = NetworkingService()
    var imageDowloadService: ImageDownloadService?
    
    var pokemonEntity: PokemonDetails? {
        didSet {
            delegate?.getPokemonEntity(entity: pokemonEntity!)
            delegate?.setupImage()
        }
    }
    
    //MARK: - Methods
    func getPokemonDetail(with url: String) {
        networkService.getDetailDataWithUrl(url: url) { result in
            switch result {
            case .failure(let error):
                debugPrint(error.localizedDescription)
            case .success(let details):
                self.pokemonEntity = details
               
            }
        }
    }
}

