//
//  DetailsPokemonViewController.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 22.04.2023.
//

import UIKit

class DetailsPokemonViewController: UIViewController {

    //MARK: - property
    var viewModel: DetailsPokemonViewControllerProtocol = DetailsPokemonViewControllerViewModel()
    
    private var pokemonEntity: PokemonDetails? {
        didSet {
            guard let name = pokemonEntity?.name else { return }
            self.nameLabel.text = name
            guard let height = pokemonEntity?.height else { return }
            self.heightLable.text = "\(height)"
            guard let weight = pokemonEntity?.weight else { return }
            self.widthLabel.text = "\(weight)"
        }
    }
    
    //MARK: - outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
   
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind()
    }

    //MARK: - methods
    func bind() {
        self.viewModel.delegate = self
    }
}

//MARK: - Extension
extension DetailsPokemonViewController: DetailsPokemonViewControllerDelegate {
    func setImage(image: UIImage) {
        self.pokemonImage.image = image
    }
    
    func getPokemonEntity(entity: PokemonDetails) {
        self.pokemonEntity = entity
    }
}
