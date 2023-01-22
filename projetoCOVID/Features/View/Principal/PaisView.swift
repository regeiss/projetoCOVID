//
//  PaisView.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 16/01/23.
//

import SwiftUI

struct PaisView: View 
{
    var countryModel: PaisModel
    var diario: [DiarioModel]
    var countryIso: String
    
    @State private var presentVC: Bool = false
    
    var body: some View 
    {
        ZStack 
        {
            VStack() 
            {
                HStack 
                {
                    Image(countryIso)
                        .resizable()
                        .frame(width: 130, height: 130, alignment: .center)
                        .shadow(color: Color(.darkGray), radius: 3, x: 2, y: 2)
                    Spacer()
                    Text(countryModel.country)
                        .font(.system(.title2, design: .serif))
                        .fontWeight(.bold)
                        .padding(5)
                        .padding(.trailing, 15)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .shadow(color: Color(.darkGray), radius: 3, x: 2, y: 2)
                }
                .padding(.horizontal, 8)
                VStack(alignment: .center, spacing: 20) 
                {
                    HStack() 
                    {
                        OKStatCard(title: "Cases", subTitle: "\(countryModel.cases.numberFormat())")
                            .padding(.leading, 5)
                            .shadow(color: Color(.darkGray), radius: 3, x: 2, y: 2)
                
                        Spacer()
                        
                        OKStatCard(title: "Deaths", subTitle: "\(countryModel.deaths.numberFormat())")
                            .padding(.trailing, 5)
                            .shadow(color: Color(.darkGray), radius: 3, x: 2, y: 2)
                    }
                    
                    HStack() 
                    {
                        OKStatCard(title: "Active", subTitle: "\(countryModel.active.numberFormat())")
                            .padding(.leading, 5)
                            .shadow(color: Color(.darkGray), radius: 3, x: 2, y: 2)
                        
                        Spacer()
                        
                        OKStatCard(title: "Recovered", subTitle: "\(countryModel.recovered.numberFormat())")
                            .padding(.trailing, 5)
                            .shadow(color: Color(.darkGray), radius: 3, x: 2, y: 2)
                    }
                }
                .padding(.top, 5)
            }
        }
        .frame(width: 340, height: 340, alignment: .center)
        .background(Color(.systemGray))
        .onTapGesture { self.presentVC = true }
        .sheet(isPresented: self.$presentVC)
        { DailyStatsVC(country: countryModel.paisName, countryModel: countryModel, diario: diario)}
    }
}
