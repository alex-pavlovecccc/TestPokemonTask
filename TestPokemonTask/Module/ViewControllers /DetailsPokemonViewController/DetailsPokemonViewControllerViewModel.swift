//
//  DetailsPokemonViewControllerViewModel.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 22.04.2023.
//

import UIKit

final class DetailsPokemonViewControllerViewModel: NSObject, DetailsPokemonViewControllerProtocol {
    //MARK: - property
    var delegate: DetailsPokemonViewControllerDelegate?
    
    var imageDownLoadService = ImageDownloadService()
    
    private var pokemontEntity: PokemonDetails? {
        didSet {
            guard let entity = pokemontEntity else { return }
            delegate?.getPokemonEntity(entity: entity)
            self.getImage()
        }
    }
    private var networkingService: NetworkingService = NetworkingService()

    //MARK: - computed properties
    var getPokemonName: String? {
        guard let name = pokemontEntity?.name else { return ""}
        return name
    }

    //MARK: - methods
    func getPokemonDetailsWith(url: String) {
        networkingService.getDetailDataWithUrl(url: url, complition: { result  in
            switch result {
            case .failure(let error):
                print("\(error.localizedDescription)")
            case .success(let entity):
                self.pokemontEntity = entity
            }
        })
    }
    
    func getImage() {
        guard let strUrl = pokemontEntity?.sprites.frontDefault else { return }
        let url = URL(string: strUrl)
        imageDownLoadService.load(url) { image in
            self.delegate?.setImage(image: image)
        }
    }
}
