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
    }
    
    //MARK: - GUI
    private lazy var pokemonTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    //MARK: - Methods
    private func bind() {
        self.viewModel.delegate = self
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
        return viewModel.getPokemonsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
