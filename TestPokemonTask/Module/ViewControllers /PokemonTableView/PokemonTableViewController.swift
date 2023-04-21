//
//  PokemonTableViewController.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 18.04.2023.
//

import UIKit

class PokemonTableViewController: UIViewController {
    
    //MARK: - properties
    
    private var viewModel: PokemonViewModelProtocol = PokemonViewModel()
    
    //MARK: - init 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGUI()
        self.setConstraints()
        self.bing()
    }
    
    //MARK: - nib file
    private var xibCell = UINib(nibName:"PokemonTableViewCell", bundle: nil)
    
    //MARK: - GUI
    private lazy var pokemonListTableView: UITableView = {
        var tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(xibCell, forCellReuseIdentifier: "PokemonTableViewCell")
        return tableView
    }()

    //MARK: - Methods
    private func setupGUI() {
        self.view.addSubview(self.pokemonListTableView)
        self.navigationItem.title = "Pokemon list"
    }
    
    private func bing() {
        self.viewModel.delegate = self
        self.viewModel.getAllPokemon()
    }
    
    //MARK: - constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([self.pokemonListTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     self.pokemonListTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                     self.pokemonListTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                                     self.pokemonListTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)])
    }
}

//MARK: - extension
extension PokemonTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getPokemonCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCells(type: PokemonTableViewCell.self, indexPath: indexPath)
        cell.viewModel.getPokemonDetail(with: self.viewModel.getUrlForDetails(for: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.heightForCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let nextVC = DetailsViewController()
        nextVC.viewModel.getPokemonDetailsWith(url:self.viewModel.getUrlForDetails(for: indexPath.row))
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension PokemonTableViewController: PokemonViewModelDelegate {
    func reloadData() {
        self.pokemonListTableView.reloadData()
    }
}
