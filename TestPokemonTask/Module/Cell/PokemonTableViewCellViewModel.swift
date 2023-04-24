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
    private var imageDownloadService = ImageDownloadService()

    var pokemonEntity: PokemonDetails? {
        didSet {
            guard let entity = pokemonEntity else { return }
            delegate?.getPokemonEntity(entity: entity)
            self.getImage()
        }
    }

    var pokemons: Pokemons? {
        didSet{
            guard let pokemons = pokemons else { return }
            delegate?.getPokemonEntityWithCoreData(entity: pokemons)
            self.getImageWithCoreData()
        }
    }
    
    func getPokemons(entity: Pokemons) {
        self.pokemons = entity
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
  
    func getImage() {
        guard let stringToUrl = pokemonEntity?.sprites?.frontDefault else { return }
        let url = URL(string: stringToUrl)
        
        self.imageDownloadService.load(url) { [weak self] image in
            self?.delegate?.setupImage(image: image)
        }
    }
    
    func getImageWithCoreData() {
        guard let stringToUrl = pokemons?.imageLink else { return }
        
        let url = URL(string: stringToUrl) 
        self.imageDownloadService.load(url) { [weak self]image in
            self?.delegate?.setupImage(image: image)
        }
    }   
}

