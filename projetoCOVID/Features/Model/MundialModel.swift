//
//  MundialModel.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 13/01/23.
//

import Foundation

struct MundialModel: Codable, Hashable 
{
    let population: Int
    let cases: Int
    let active: Int
    let deaths: Int
    let recovered: Int
    
    // MARK: - Mundial Model Computed Properties
    var statOfCases: String
    {
        if cases == 0
        {
            return "N/A\n"
        } 
        else 
        {
            return "\(cases.numberFormat())\n" + "\(((Double(cases) * 100) / Double(population)).rounded(by: 2))% of the population"
        }
    }
    
    var statOfDeaths: String
    {
        if deaths == 0
        {
            return "N/A\n"
        } 
        else 
        {
            return "\(deaths.numberFormat())\n" + "\(((Double(deaths) * 100) / Double(cases)).rounded(by: 2))% of total casos"
        }
    }
    
    var statOfActive: String
    {
        if recovered == 0
        {
            return "N/A\n"
        } 
        else 
        {
            return "\(active.numberFormat())\n" + "\(((Double(active) * 100) / Double(population)).rounded(by: 2))% da população"
        }
    }
    
    var statOfRecovered: String
    {
        if recovered == 0
        {
            return "N/A\n"
        } 
        else 
        {
            return "\(recovered.numberFormat())\n" + "\(((Double(recovered) * 100) / Double(cases)).rounded(by: 2))% of total casos"
        }
    }
}
