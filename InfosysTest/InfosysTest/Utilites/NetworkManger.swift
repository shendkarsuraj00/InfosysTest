//
//  NetworkManger.swift
//  InfosysTest
//
//  Created by Macbook on 05/02/25.
//

import Foundation

final class NetworkManger {
    
    static let shared = NetworkManger()
    private init() {}
    
    func loadCities(completion: @escaping (Result<[citySection], Error>) -> Void) {
        
        if let url = Bundle.main.url(forResource: Constants.jsonFileName, withExtension: Constants.jsonFileExtension) {
            if let data = try? Data(contentsOf: url) {
                do {
                    let cities = try JSONDecoder().decode([City].self, from: data)
                    let state = Dictionary(grouping: cities) { $0.state }
                    let sections = state.map { citySection(name: $0.key, cities: $0.value)}.sorted { $0.name < $1.name }
                    completion(.success(sections))
                } catch let error {
                    print("\(error)")
                    completion(.failure(error))
                }
            }
        }
    }
}
