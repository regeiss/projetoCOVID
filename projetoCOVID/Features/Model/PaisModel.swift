//
//  PaisModel.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 13/01/23.
//

import Foundation
import MapKit

struct PaisModel: Codable, Hashable 
{
    let pais: String
    let paisInfo: PaisInfo
    let populacao: Int
    let atualizado: Double
    let testes: Int
    let casos: Int
    let ativos: Int
    let mortes: Int
    let recuperados: Int
    
    // MARK: - Pais Model Computed Properties
    var paisName: String 
    {
        var denominacao = ""
        if pais == "USA" 
        {
            denominacao = "United States of America"
        } 
        else if pais == "UK" 
        {
            denominacao = "United Kingdom"
        } 
        else 
        {
            denominacao = pais
        }
        return denominacao
    }
    
    var atualizadoLblText: String 
    {
        let converted   = (atualizado / 1000).getDateFromTimeStamp()
        let dateLblText = "última atualização: " + converted + " (GMT)"
        
        return dateLblText
    }
    
    var statOfCases: String 
    {
        if cases == 0 
        {
            return "N/A\n"
        } 
        else 
        {
            return "\(cases.numberFormat())\n" + "\(((Double(cases) * 100) / Double(populacao)).rounded(by: 2))% of the populacao"
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
            return "\(mortes.numberFormat())\n" + "\(((Double(mortes) * 100) / Double(cases)).rounded(by: 2))% of total cases"
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
            return "\(ativos.numberFormat())\n" + "\(((Double(ativos) * 100) / Double(populacao)).rounded(by: 2))% of the populacao"
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
            return "\(recuperados.numberFormat())\n" + "\(((Double(recuperados) * 100) / Double(cases)).rounded(by: 2))% of total cases"
        }
    }
}

struct PaisInfo: Codable, Hashable 
{
    let _id : Double?
    let flag : String?
    let iso2 : String?
    let iso3 : String?
    let lat : Double?
    let long: Double?
    
    // MARK: - Pais Info Computed Properties
    var location: CLLocationCoordinate2D? 
    {
        CLLocationCoordinate2D(latitude: lat ?? 0, longitude: long ?? 0)
    }
}

struct AnotationModel: Codable, Identifiable 
{
    var id = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
    var cases: Int
    var mortes: Int
    
    // MARK: - Anotation Model Computed Properties
    var location: CLLocationCoordinate2D 
    {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
