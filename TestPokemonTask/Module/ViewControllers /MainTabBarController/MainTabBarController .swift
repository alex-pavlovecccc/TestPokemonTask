//
//  MainTabBarController .swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 18.04.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {

    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers()
    }
    
    //MARK: - Methods
    private func generateViewControllers(viewController: UIViewController, isLargeTitle: Bool) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = isLargeTitle
        return navigationController
    }
    
    private func setViewControllers() {
        self.viewControllers = [generateViewControllers(viewController: PokemonTableViewController(), isLargeTitle: true), generateViewControllers(viewController: SavedViewController(), isLargeTitle: true)]
    }
}
