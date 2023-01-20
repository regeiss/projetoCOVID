//
//  Forms.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 18/01/23.
//

import SwiftUI

struct CountryInfoForm: View 
{
    var countryData: PaisModel
    var body: some View 
    {
        Form 
        {
            Section(header: Text(countryData.atualizadoLblText))
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

struct CountryStatsCard: View 
{
    var countryData: PaisModel

    var body: some View 
    {
        ZStack 
        {
            VStack() 
            {
                HStack 
                {
                    Image(countryData.country.lowercased())
                        .resizable()
                        .frame(width: 130, height: 130, alignment: .center)
                        .shadow(color: Color(.darkGray), radius: 1, x: 2, y: 2)
                    Spacer()
                    VStack {
                        Text(countryData.paisName)
                            .font(.system(.title2, design: .serif))
                            .fontWeight(.bold)
                            .foregroundColor(Color(.darkText))
                            .padding(5)
                        Text("Population\n" + "\(countryData.population.numberFormat())")
                            .font(.system(size: 17, design: .serif))
                            .fontWeight(.light)
                            .foregroundColor(Color(.label))
                    }
                    .shadow(color: Color(.darkGray), radius: 0.5, x: 0.3, y: 0.3)
                    .padding(.trailing, 15)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                }
                .padding(.horizontal, 8)
                VStack(alignment: .center, spacing: 20) 
                {
                    HStack() 
                    {
                        OKStatCard(title: "Cases", subTitle: countryData.statOfCases)
                            .padding(.leading, 5)
                        Spacer()
                        OKStatCard(title: "Deaths", subTitle: countryData.statOfDeaths)
                            .padding(.trailing, 5)
                    }
                    
                    HStack() 
                    {
                        OKStatCard(title: "Active", subTitle: countryData.statOfActive)
                            .padding(.leading, 5)
                        Spacer()
                        OKStatCard(title: "Recovered", subTitle: countryData.statOfRecovered)
                            .padding(.trailing, 5)
                    }
                }
                .padding(.top, 5)
            }
        }
        .frame(width: 340, height: 340, alignment: .center)
        .background(Color(.systemGray))
        .cornerRadius(13)
    }
}

struct WorldStatsCard: View 
{
    var worldData: MundialModel
        
    var body: some View 
    {
        VStack(spacing: 0) 
        {
            Text("WORLD STATS")
                .font(.system(.largeTitle, design: .serif))
                .fontWeight(.black)
                .shadow(color: .secondary, radius: 1, x: 0.7, y: 0.7)
            
            ZStack 
            {
                VStack(spacing: 20) 
                {
                    Text("Population: \(worldData.population.numberFormat())")
                        .font(.system(size: 17, design: .serif))
                        .fontWeight(.light)
                        .shadow(color: Color(.darkGray), radius: 1, x: 0.7, y: 0.7)
                        .foregroundColor(Color(.label))
                        .padding(.top, 5)
                
                    VStack(alignment: .center, spacing: 20) 
                    {
                        HStack() 
                        {
                            OKStatCard(title: "Cases", subTitle: worldData.statOfCases)
                                .padding(.leading, 5)
                            Spacer()
                            OKStatCard(title: "Deaths", subTitle: worldData.statOfDeaths)
                                .padding(.trailing, 5)
                        }

                        HStack() 
                        {
                            OKStatCard(title: "Active", subTitle: worldData.statOfActive)
                                .padding(.leading, 5)
                            Spacer()
                            OKStatCard(title: "Recovered", subTitle: worldData.statOfRecovered)
                                .padding(.trailing, 5)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .background(Color(.systemGray))
            .cornerRadius(9)
            .padding(.horizontal, 8)
        }
    }
}



