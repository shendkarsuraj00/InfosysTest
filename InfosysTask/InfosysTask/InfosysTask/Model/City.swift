//
//  City.swift
//  InfosysTask
//
//  Created by Macbook on 05/02/25.
//

import Foundation

struct City: Identifiable, Codable {
    let id = UUID()
    let city: String
    let latitude: String
    let longitude: String
    let country: String
    let iso2: String
    let state: String
    let capital: String?
    let population: String
    let populationProper: String
    
    enum CodingKeys: String, CodingKey {
        case city, latitude = "lat", longitude = "lng", country, iso2, state = "admin_name", capital, population, populationProper = "population_proper"
    }
}


struct citySection: Identifiable {
    let id = UUID()
    let name: String
    let cities: [City]
}
