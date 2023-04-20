//
//  PokemonTableViewCell.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 18.04.2023.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    //MARK: - outlet
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - Properties
    var viewModel: PokemonTableViewCellViewModelProtocol = PokemonTableViewCellViewModel()
    var pokemonEntity: PokemonDetails? {
        didSet{
            self.nameLabel.text = pokemonEntity?.name ?? ""
        }
    }
    
    private var imageDownLoadService = ImageDownloadService()
    //MARK: - init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bind()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Method
    private func contentViewApperance() {
        self.cellContentView.layer.cornerRadius = self.cellContentView.bounds.height / 2
    }
    
    private func bind() {
        self.viewModel.delegate = self
    }
}

//MARK: - extension 
extension PokemonTableViewCell: PokemonTableViewCellViewModelDelegate {
    func getPokemonEntity(entity: PokemonDetails) {
        self.pokemonEntity = entity
    }

    func setupImage() {
        guard let strUrl = pokemonEntity?.sprites.frontDefault else { return }
        let url = URL(string: strUrl)
        self.imageDownLoadService.load(url) { [weak self] image in
            self?.pokemonImage.image = image
        }
    }
}

