//
//  MapaMundiView.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 15/01/23.
//

import SwiftUI
import MapKit

struct MapaMundiView: View
{
    @StateObject var viewModel = MapaMundiViewModel()
    
    var body: some View
    {
        NavigationView
        {
            Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.anotationsData, annotationContent: { country in
                MapAnnotation(coordinate: country.location)
                {
                    MapaMundiAnnotation(countryName: country.name.lowercased(), cases: country.casos, deaths: country.mortes)
                }
            })
            .onAppear(perform: { viewModel.getData()})
            .navigationBarTitle("World Map", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
