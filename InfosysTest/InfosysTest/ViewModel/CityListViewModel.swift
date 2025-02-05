//
//  CityListViewModel.swift
//  InfosysTest
//
//  Created by Macbook on 05/02/25.
//

import SwiftUI
 
class CityListViewModel: ObservableObject {
    @Published var citySections: [citySection] = []
    @Published var expandSection: Set<UUID> = []
    
    init() {
        loadCities()
    }
    
    func loadCities() {
        NetworkManger.shared.loadCities { result in
            switch result {
                
            case .success(let section):
                self.citySections = section
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func toggleSection(section: citySection) {
        if expandSection.contains(section.id) {
            expandSection.remove(section.id)
        } else {
            expandSection.insert(section.id)
        }
    }
    
    func isExpandSection(section: citySection) -> Bool {
        expandSection.contains(section.id)
    }
}
