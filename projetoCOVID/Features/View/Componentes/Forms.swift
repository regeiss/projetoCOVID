//
//  Forms.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 18/01/23.
//

import SwiftUI

struct CountryInfoForm: View 
{
    var countryData: CountryModel
    var body: some View 
    {
        Form 
        {
            Section(header: Text(countryData.updatedLblText)) 
            {
                HStack 
                {
                    Image(systemName: "person.2")
                        .frame(width: 20, height: 20, alignment: .center)
                    Text("Population").foregroundColor(Color.gray)
                    Spacer()
                    Text(countryData.population.numberFormat())
                }
                HStack 
                {
                    Image(systemName: "eyedropper.halffull")
                        .frame(width: 20, height: 20, alignment: .center)
                    Text("Tests").foregroundColor(Color.gray)
                    Spacer()
                    Text(countryData.tests.numberFormat())
                }
                HStack 
                {
                    Image(systemName: "thermometer")
                        .frame(width: 20, height: 20, alignment: .center)
                    Text("Cases").foregroundColor(Color.gray)
                    Spacer()
                    Text(countryData.cases.numberFormat())
                }
                HStack 
                {
                    Image(systemName: "heart.slash")
                        .frame(width: 20, height: 20, alignment: .center)
                    Text("Deaths").foregroundColor(Color.gray)
                    Spacer()
                    Text(countryData.deaths.numberFormat())
                }
            }
        }
        .frame(height: 220, alignment: .top)
        .disabled(true)
    }
}
