//
//  EstatisticasTotalViewModel.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 16/01/23.
//

import SwiftUI

final class EstatisticasTotalViewModel: ObservableObject 
{
    @Published var worldData: MundialModel?
    @Published var countriesData: [PaisModel] = []
    @Published var isLoading = true
    @Published var isShowingDetailView = false
    
    var selectedCountry: PaisModel? 
    {
        didSet { isShowingDetailView = true }
    }
    
    private let countries = ["usa", "uk", "ita", "fr", "esp", "deu", "tr", "can", "au", "bra"]
    
    func getTotalStatsData() 
    {
        NetworkManager.shared.fetch(for: nil, ifDaily: false) { (result: MundialModel) in
            DispatchQueue.main.async {
                self.worldData = result
            }
        }
        
        for item in countries 
        {
            NetworkManager.shared.fetch(for: item, ifDaily: false) { (result: PaisModel) in
                DispatchQueue.main.sync {
                    self.countriesData.append(result)
                    self.countriesData.sort { $1.cases < $0.cases }
                    
                    if self.countriesData.count == self.countries.count 
                    {
                        self.isLoading = false
                    }
                }
            }
        }
    }
}
