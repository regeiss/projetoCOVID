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
            Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255)
            EstatisticasTotalView()
                .tabItem({
                    Image(systemName: "person.3.fill")
                    Text("Total Stats")
                })
            MapaMundiView()
                .tabItem({
                    Image(systemName: "map.fill")
                    Text("Map")
                })
            PaisListaView()
                .tabItem({
                    Image(systemName: "list.dash")
                    Text("Countries")
                })
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color.primary)

    }
}
//Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255)
