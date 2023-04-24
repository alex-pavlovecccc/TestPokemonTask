//
//  DetailsPokemonViewController.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 22.04.2023.
//

import UIKit

class DetailsPokemonViewController: UIViewController, AlertHandler {
    
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
            guard let entity = pokemonEntity?.types?.first?.type.name else { return }
            self.abilityLabel.text = entity
        }
    }
    
    //MARK: - outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var abilityView: UIView!
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var heightView: UIView!
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind()
        self.setAppearance()
        self.addTarger()
    }
    
    //MARK: - methods
    private func bind() {
        self.viewModel.delegate = self
    }
    
    private func setAppearance() {
        self.makeGradient()
        self.abilityView.layer.cornerRadius = Constants.cornerRadius
        self.weightView.layer.cornerRadius = Constants.cornerRadius
        self.heightView.layer.cornerRadius = Constants.cornerRadius
        self.likeButton.layer.cornerRadius = Constants.cornerRadius
        self.navigationItem.titleView?.tintColor = UIColor.black
    }
    
    private func addTarger() {
        self.likeButton.addTarget(self, action: #selector(likeButtonDidTap), for: .touchUpInside)
    }
    
    
    func showAlert() {
        self.viewModel.delegate?.showPokemonDetailsAlert(title: "Great! ", message: "You have added a new Pokemon")
    }
    
    //MARK: - Gradient
    private func makeGradient() {
        let topColor = UIColor(red: 0.110, green: 0.573, blue: 0.824, alpha: 1.00).cgColor
        let bottomColor = UIColor(red: 0.950, green: 1.00, blue: 0.99, alpha: 1.00).cgColor
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [topColor, bottomColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    //MARK: - button Action
    @objc func likeButtonDidTap() {
        let pokemon = Pokemons(context: CoreDataService.managedObjectContext)
        pokemon.imageLink = pokemonEntity?.sprites?.frontDefault ?? ""
        pokemon.name = pokemonEntity?.name ?? ""
        pokemon.weight = String(pokemonEntity?.weight ?? 0)
        pokemon.height = String(pokemonEntity?.height ?? 0)
        CoreDataService.saveContext()
        self.showAlert()
    }
}

//MARK: - Extension
extension DetailsPokemonViewController: DetailsPokemonViewControllerDelegate {
    func showPokemonDetailsAlert(title: String, message: String) {
        showAlert(title: title, message: message)
    }
    
    func setImage(image: UIImage) {
        self.pokemonImage.image = image
    }
    
    func getPokemonEntity(entity: PokemonDetails) {
        self.pokemonEntity = entity
    }
}
