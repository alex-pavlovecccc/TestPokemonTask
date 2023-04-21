//
//  API.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 18.04.2023.
//

import UIKit

final class API {
    //MARK: - base host
    private let baseHost = "https://pokeapi.co/api/v2/pokemon"
    
    //MARK: - methods 
    func getURL() -> String {
        return baseHost
    }
}
