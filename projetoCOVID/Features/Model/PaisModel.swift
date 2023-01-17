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
    let country : String
       let countryInfo : PaisInfo
       let population : Int
       let updated : Double
       let tests : Int
       let cases : Int
       let active : Int
       let deaths : Int
       let recovered : Int
    
    // MARK: - Pais Model Computed Properties
    var paisName: String 
    {
        var denominacao = ""
        if country == "USA"
        {
            denominacao = "United States of America"
        } 
        else if country == "UK"
        {
            denominacao = "United Kingdom"
        } 
        else 
        {
            denominacao = country
        }
        return denominacao
    }
    
    var atualizadoLblText: String 
    {
        let converted   = (updated / 1000).getDateFromTimeStamp()
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
            return "\(cases.numberFormat())\n" + "\(((Double(cases) * 100) / Double(population)).rounded(by: 2))% of the populacao"
        }
    }
    
    var statOfMortes: String 
    {
        if deaths == 0
        {
            return "N/A\n"
        } 
        else 
        {
            return "\(deaths.numberFormat())\n" + "\(((Double(deaths) * 100) / Double(cases)).rounded(by: 2))% of total cases"
        }
    }
    
    var statOfAtivos: String 
    {
        if recovered == 0
        {
            return "N/A\n"
        } 
        else 
        {
            return "\(active.numberFormat())\n" + "\(((Double(active) * 100) / Double(population)).rounded(by: 2))% of the populacao"
        }
    }
    
    var statOfRecuperados: String 
    {
        if recovered == 0
        {
            return "N/A\n"
        } 
        else 
        {
            return "\(recovered.numberFormat())\n" + "\(((Double(recovered) * 100) / Double(cases)).rounded(by: 2))% of total cases"
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
    var casos: Int
    var mortes: Int
    
    // MARK: - Anotation Model Computed Properties
    var location: CLLocationCoordinate2D 
    {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
