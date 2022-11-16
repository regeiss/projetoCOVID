//
//  ContentView.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 15/11/22.
//

import SwiftUI

struct ContentView: View
{
    let frame = TabularData()
    var body: some View
    {
        VStack
        {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
           
        }
        .padding()
        .onAppear {frame.imprimir()}
    }
}

