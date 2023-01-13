//
//  LinhaTempoModel.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 13/01/23.
//

import Foundation

struct TimelineModel: Codable, Hashable 
{
    let pais: String
    let provincia: [String]
    let linhatempo: LinhaTempoInfoModel
}

struct LinhaTempoInfoModel: Codable, Hashable 
{
    let casos, mortes, recuperados: [String: Int]
}

struct LinhaTempoData 
{
    var pais: String
    var casosLinhaTempo: Array<(key: Date, value: Int)>
    var mortesLinhaTempo: Array<(key: Date, value: Int)>
}

struct DiarioModel: Hashable 
{
    let uuid = UUID()

    let dData: Date
    let dCasos: Int
    let dMortes: Int
}
