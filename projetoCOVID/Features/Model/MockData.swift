//
//  MockData.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 16/01/23.
//

import Foundation

struct MockData {
    static let sampleWorldData      = MundialModel(population: 7787962770,
                                                 cases: 56342420,
                                                 active: 15778135,
                                                 deaths: 1350973,
                                                 recovered: 39213312)
    
    static let sampleCountryInfo    = PaisInfo(_id: 840,
                                                  flag: "https://disease.sh/assets/img/flags/us.png",
                                                  iso2: "US",
                                                  iso3: "USA",
                                                  lat: 38,
                                                  long: -97)
    
    static let sampleCountryData    = PaisModel(country: "USA",
                                                   countryInfo: sampleCountryInfo,
                                                   population: 331743344,
                                                   updated: 1605727532041,
                                                   tests: 172178586,
                                                   cases: 11758671,
                                                   active: 4389449,
                                                   deaths: 255112,
                                                   recovered: 7114110)
}
