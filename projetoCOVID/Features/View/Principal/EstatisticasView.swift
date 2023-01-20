//
//  EstatisticasView.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 16/01/23.
//

import SwiftUI

struct EstatisticasView: View 
{
    @State var country: String
    @State var countryModel: PaisModel
    @State var diario: [DiarioModel]
    
    var body: some View 
    {
        NavigationView  
        {
            ScrollView 
            {
                VStack 
                {
                    CountryInfoForm(countryData: countryModel)
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    InsetMapView(countryData: countryModel)
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    DailyStatsList(dailyData: $diario)
                }
            }
            .padding(0)
            .navigationBarTitle("About " + country, displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

