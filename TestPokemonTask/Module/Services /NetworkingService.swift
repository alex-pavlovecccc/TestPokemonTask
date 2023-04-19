//
//  NetworkingService.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 18.04.2023.
//

import Foundation

final class NetworkingService {

    private let api = API()
    
    //MARK: - method
    func getDataWithDataTask(complition: @escaping(Result<PokemonResult, ResponseError>) -> Void) {
        let url = URL(string: api.getURL())
        
        guard let url = url else  {
            DispatchQueue.main.async {
                complition(.failure(ResponseError.URLError))
            }
            return
        }
        
        dataTaskWithURL(model: PokemonResult.self, url: url) { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    complition(.failure(error))
                }
            case .success(let pokemons):
                DispatchQueue.main.async {
                    complition(.success(pokemons))
                }
            }
        }
    }
    
    func getDitailDataWithUrl(url: String?, complition: @escaping(Result<PokemonDitails, ResponseError>) -> Void) {
        guard let urlString = url else { return }
        
        let url = URL(string: urlString)
        
        guard let url = url else {
            DispatchQueue.main.async {
                complition(.failure(ResponseError.URLError))
            }
            return
        }
        
        dataTaskWithURL(model: PokemonDitails.self, url: url) { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    complition(.failure(error))
                }
            case .success(let pokemenDitails):
                DispatchQueue.main.async {
                    complition(.success(pokemenDitails))
                }
            }
        }
    }
    
    private func dataTaskWithURL<T: Codable> (model: T.Type, url: URL, complition: @escaping(Result<T, ResponseError>) -> Void){
        
        URLSession.shared.dataTask(with: url) {data, dataResponse, error in
            do {
                guard error == nil else {
                    throw ResponseError.error
                }
                
                guard let data = data else {
                    throw ResponseError.invalidData
                }
                
                guard let pokemonList = try? JSONDecoder().decode(model.self, from: data) else {
                    throw ResponseError.invalidData
                }
                
                DispatchQueue.main.async {
                    complition(.success(pokemonList))
                }
                
            } catch {
                guard let error = error as? ResponseError else { return }
                complition(.failure(error))
            }
        }.resume()
    }
    
    //MARK: - error enum
    enum ResponseError: Error {
        case URLError
        case invalidResponse
        case invalidData
        case error
        case decodingError
    }
}
