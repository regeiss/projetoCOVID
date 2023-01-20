//
//  ListaPaisesViewModel.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 16/01/23.
//

import SwiftUI

final class ListaPaisesViewModel: ObservableObject
{
    @Published var countriesData: [PaisModel] = []
    @Published var isShowingDetailView = false
    @Published var sortedBy = "name"
    
    var selectedCountry: PaisModel?
    {
        didSet
        {
            isShowingDetailView = true
        }
    }
    
    func getCountryListData()
    {
        NetworkManager.shared.fetch(for: "", ifDaily: false) { (result: [PaisModel]) in
            DispatchQueue.main.async
            {
                self.countriesData = result.sorted {
                    if self.sortedBy == "cases" {
                        return $0.cases > $1.cases
                    } else if self.sortedBy == "deaths" {
                        return $0.deaths > $1.deaths
                    } else {
                        return $1.paisName > $0.paisName
                    }
                }
            }
        }
    }
}
