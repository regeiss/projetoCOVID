//
//  MapaMundiViewModel.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 13/01/23.
//

import Foundation
import SwiftUI
import MapKit

final class MapaMundiViewModel: ObservableObject
{
    @Published var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 55.000000, longitude: 15.0000000)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 40.0, longitudeDelta: 40)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    @Published var countriesData: [PaisModel]   = []
    @Published var anotationsData: [AnotationModel] = []
    
    func getData()
    {
        NetworkManager.shared.fetch(for: "", ifDaily: false) { (result: [PaisModel]) in
            DispatchQueue.main.async { [self] in
                self.countriesData = result
                
                for item in countriesData
                {
                    if item.casos > 1000
                    {
                        anotationsData.append(AnotationModel(name: item.pais, latitude: item.paisInfo.lat ?? 0, longitude: item.paisInfo.long ?? 0, casos: item.casos, mortes: item.mortes))
                    }
                }
            }
        }
    }
}
