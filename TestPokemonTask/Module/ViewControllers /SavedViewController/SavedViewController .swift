//
//  SavedViewController .swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 23.04.2023.
//

import UIKit

final class SavedViewController: UIViewController {
    
    //MARK: - ViewModel
    var viewModel: SavedViewControllerViewModelProtocol = SavedViewControllerViewModel()
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind()
        self.setupGUI()
        self.setupConstraints()
    }
    
    //MARK: - nib file
    private var xibCell = UINib(nibName:"PokemonTableViewCell", bundle: nil)
    
    //MARK: - GUI
    private lazy var pokemonTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(xibCell, forCellReuseIdentifier: "PokemonTableViewCell")
        return table
    }()
    
    //MARK: - Methods
    private func bind() {
        self.viewModel.delegate = self
    }
    
    private func setupGUI() {
        self.view.addSubview(self.pokemonTableView)
        self.navigationItem.title = "Favorite"
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([self.pokemonTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     self.pokemonTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                     self.pokemonTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                                     self.pokemonTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)])
    }
}

extension SavedViewController: SavedViewControllerViewModelDelegate {
    func reloadData() {
        self.pokemonTableView.reloadData()
    }
}

//MARK: - Extension
extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCells(type: PokemonTableViewCell.self, indexPath: indexPath)
        cell.viewModel.getPokemons(entity: (self.viewModel.pokemons?[indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.heightForCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
