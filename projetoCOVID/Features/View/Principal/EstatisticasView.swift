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
    @State var countryModel: CountryModel
    
    var body: some View 
    {
        NavigationView  
        {
            ScrollView 
            {
                VStack 
                {
                    CountryInfoForm(countryModel: countryModel)
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    InsetMapView()
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    DailyStatsList(country: country)
                }
            }
            .padding(0)
            .navigationBarTitle("About " + country, displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

