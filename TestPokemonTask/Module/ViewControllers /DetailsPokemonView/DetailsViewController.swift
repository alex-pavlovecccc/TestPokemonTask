//
//  DetailsViewController.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 21.04.2023.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    //MARK: - Property
    var viewModel: DetailsViewModelProtocol = DetailsViewModel()
    
    private var pokemonEntity: PokemonDetails? {
        didSet {
            guard let name = pokemonEntity?.name else { return }
            self.pokemonName.text = name
        }
    }
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGUI()
        self.setupConstraints()
        self.bind()
    }
    
    //MARK: - GUI
    private lazy var pokemonMainImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .none
        return image
    }()
    
    private lazy var pokemonName: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 23)
        label.textAlignment = .left
        return label
    }()
    
    //MARK: - Method
    private func setupGUI() {
        self.navigationItem.title = "Pokemon details"
        self.view.addSubview(self.pokemonMainImage)
        self.view.addSubview(self.pokemonName)
    }
    
    func bind() {
        self.viewModel.delegate = self
    }

    //MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([self.pokemonMainImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     self.pokemonMainImage.heightAnchor.constraint(equalToConstant: Constants.height),
                                     self.pokemonMainImage.widthAnchor.constraint(equalToConstant: Constants.width),
                                     self.pokemonMainImage.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor, constant: Constants.offsetForTop)])
        
        NSLayoutConstraint.activate([self.pokemonName.topAnchor.constraint(equalTo: self.pokemonMainImage.bottomAnchor, constant: Constants.offset),
                                     self.pokemonName.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Constants.offset)])
    }
}

//MARK: - Extension
extension DetailsViewController: DetailsViewModelDelegate {
    func getPokemonEntity(entity: PokemonDetails) {
        self.pokemonEntity = entity
    }
    
    func setImage(image: UIImage) {
        self.pokemonMainImage.image = image
    }
}
