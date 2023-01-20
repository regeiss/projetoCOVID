//
//  PaisDetalheViewModel.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 16/01/23.
//

import SwiftUI

final class PaisDetalheViewModel: ObservableObject 
{
    @Published var dailyData: [DiarioModel] = []
    
    func getDailyStatsData(for country: String) 
    {
        NetworkManager.shared.fetch(for: country, ifDaily: true) { (result: TimelineModel) in
            
            let casesDict = self.convertTimelineData(timeline: result.linhatempo.casos)
            let deathsDict = self.convertTimelineData(timeline: result.linhatempo.mortes)
            let timelineData = LinhaTempoData(pais: result.pais, casosLinhaTempo: casesDict, mortesLinhaTempo: deathsDict)
            
            DispatchQueue.main.async {
                self.updateArray(with: timelineData)
            }
        }
    }
    
    func convertTimelineData(timeline: [String: Int]) -> Array<(key: Date, value: Int)> 
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        var dateDictionary = [Date: Int]()
        
        for (key, value) in timeline 
        {
            let date = dateFormatter.date(from: key)
            dateDictionary[date!] = value
        }
        
        return dateDictionary.sorted { $0.0 < $1.0 }
    }
    
    func updateArray(with timelineData: LinhaTempoData) 
    {
        for i in 1...timelineData.casosLinhaTempo.count - 1 
        {
            self.dailyData.append(.init(dDate: timelineData.casosLinhaTempo[i].key, dCases: timelineData.casosLinhaTempo[i].value - timelineData.casosLinhaTempo[i-1].value, dDeaths: timelineData.mortesLinhaTempo[i].value - timelineData.mortesLinhaTempo[i-1].value))
        }
        
        var reversedNames = [DiarioModel]()

        for name in dailyData 
        {
            reversedNames.insert(name, at: 0)
        }
        
        self.dailyData = reversedNames
    }
}

