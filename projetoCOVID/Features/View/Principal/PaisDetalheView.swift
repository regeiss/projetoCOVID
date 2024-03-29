//
//  PaisDetalheView.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 16/01/23.
//

import SwiftUI
import MapKit

struct CountryDetailView: View 
{
    @StateObject var viewModel  = PaisDetalheViewModel()
    
    @State var countryData: PaisModel
    @Binding var isShowingDetail: Bool
    
    var body: some View 
    {
        NavigationView 
        {
            ScrollView 
            {
                VStack 
                {
                    CountryInfoForm(countryData: countryData)
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    InsetMapView(countryData: countryData, region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: countryData.countryInfo.lat ?? 48, longitude: countryData.countryInfo.long ?? 9), span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)))
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    DailyStatsList(dailyData: $viewModel.dailyData)
                        .onAppear(perform: {
                            UITableView.appearance().showsVerticalScrollIndicator = false
                            viewModel.getDailyStatsData(for: countryData.country)
                        })
                }
            }
            .padding(0)
            .navigationBarTitle("About " + countryData.country, displayMode: .inline)
            .navigationBarItems(trailing: OKXMarkButton()
                                    .onTapGesture {
                                        isShowingDetail = false
                                    })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

