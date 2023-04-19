//
//  TableView + Extension.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 18.04.2023.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCells<CellType>(type: CellType.Type, indexPath: IndexPath) -> CellType {
        self.dequeueReusableCell(withIdentifier: "\(CellType.self)", for: indexPath) as! CellType
    }
}
