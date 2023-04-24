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
    private func generateViewControllers(viewController: UIViewController, isLargeTitle: Bool, image: UIImage?, tag: Int, title: String) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = isLargeTitle
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        return navigationController
    }
    
    private func setViewControllers() {
        self.viewControllers = [generateViewControllers(viewController: PokemonTableViewController(), isLargeTitle: true, image: UIImage(systemName: "list.bullet"), tag: 0, title: "list"), generateViewControllers(viewController: SavedViewController(), isLargeTitle: true, image: UIImage(systemName: "suit.heart"), tag: 0, title: "Favorite")]
    }
}
