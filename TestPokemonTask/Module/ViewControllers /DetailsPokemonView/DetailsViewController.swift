//
//  DetailsViewController.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 21.04.2023.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    //MARK: - Property
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGUI()
        self.setupConstraints()
  
    }
    
    //MARK: - GUI
    private lazy var pokemonMainImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: - Method
    private func setupGUI() {
        self.view.addSubview(self.pokemonMainImage)
    }

    //MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([self.pokemonMainImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     self.pokemonMainImage.heightAnchor.constraint(equalToConstant: Constants.height),
                                     self.pokemonMainImage.widthAnchor.constraint(equalToConstant: Constants.width),
                                     self.pokemonMainImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -Constants.offsetForTop)])
    }
}
