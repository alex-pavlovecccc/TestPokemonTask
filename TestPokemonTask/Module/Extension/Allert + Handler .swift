//
//  Allert + Handler .swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 22.04.2023.
//

import UIKit

protocol AlertHandler where Self: UIViewController { }

extension AlertHandler {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
