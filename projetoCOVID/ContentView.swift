//
//  ContentView.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 15/11/22.
//
import SwiftUI

struct ContentView: View 
{
    var body: some View 
    {
        TabView 
        {
            TotalStatsView()
                .tabItem({
                    Image(systemName: "person.3.fill")
                    Text("Total Stats")
                })
            WorldMapView()
                .tabItem({
                    Image(systemName: "map.fill")
                    Text("Map")
                })
            CountryListView()
                .tabItem({
                    Image(systemName: "list.dash")
                    Text("Countries")
                })
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color.primary)
    }
}

