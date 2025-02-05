//
//  CityListView.swift
//  InfosysTest
//
//  Created by Macbook on 05/02/25.
//

import SwiftUI

struct CityListView: View {
    
    @StateObject private var viewModel = CityListViewModel()
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Button {
                    viewModel.citySections.reverse()
                } label: {
                    Text(Constants.reverseButtonName)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(.buttonBorder)
                }
                .padding()
                
                List(viewModel.citySections, id: \.id) { section in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(section.name)
                                .font(.subheadline)
                            Spacer()
                            Image(systemName: (viewModel.isExpandSection(section: section) ? Constants.downArrowImageName: Constants.rightArrowImageName))
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.toggleSection(section: section)
                    }
                    
                    if viewModel.isExpandSection(section: section) {
                        ForEach(section.cities) { city in
                            VStack(alignment: .leading) {
                                Text(city.city)
                                    .font(.subheadline)
                                
                                Text("\(Constants.population): \(city.population)")
                                    .font(.caption)
                            }
                            .padding(.leading, 20)
                        }
                    }
                }
                .navigationTitle(Constants.viewTitle)
                .toolbar {
                    ToolbarItem( placement: .topBarTrailing) {
                        Button {
                            viewModel.loadCities()
                        } label: {
                            Image(systemName: "arrow.clockwise")
                        }
                        
                    }
                }
            }
        }
    }
    
}

#Preview {
    CityListView()
}
