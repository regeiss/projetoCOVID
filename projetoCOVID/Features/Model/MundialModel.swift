//
//  MundialModel.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 13/01/23.
//

import Foundation

struct MundialModel: Codable, Hashable 
{
    let populacao: Int
    let casos: Int
    let ativos: Int
    let mortes: Int
    let recuperados: Int
    
    // MARK: - Mundial Model Computed Properties
    var statOfCasos: String 
    {
        if casos == 0 
        {
            return "N/A\n"
        } 
        else 
        {
            return "\(casos.numberFormat())\n" + "\(((Double(casos) * 100) / Double(population)).rounded(by: 2))% of the population"
        }
    }
    
    var statOfMortes: String 
    {
        if mortes == 0 
        {
            return "N/A\n"
        } 
        else 
        {
            return "\(mortes.numberFormat())\n" + "\(((Double(mortes) * 100) / Double(casos)).rounded(by: 2))% of total casos"
        }
    }
    
    var statOfAtivos: String 
    {
        if recuperados == 0 
        {
            return "N/A\n"
        } 
        else 
        {
            return "\(active.numberFormat())\n" + "\(((Double(active) * 100) / Double(population)).rounded(by: 2))% da população"
        }
    }
    
    var statOfRecuperados: String 
    {
        if recuperados == 0 
        {
            return "N/A\n"
        } 
        else 
        {
            return "\(recuperados.numberFormat())\n" + "\(((Double(recuperados) * 100) / Double(casos)).rounded(by: 2))% of total casos"
        }
    }
}
