//
//  NetworkManager.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 13/01/23.
//

import Foundation

class NetworkManager 
{
    static let shared = NetworkManager()
    private let baseURL = "https://disease.sh/v2/"
    
    private init() {}
    
    func fetch<Model: Decodable>(for country: String?, ifDaily: Bool, completed: @escaping (Model) -> ()) 
    {
        let status: String = ifDaily ? "historical" : "countries"
        let duration: String = ifDaily ? "?lastdays=365" : ""
        var endpoint: String = baseURL + "all"
        
        if let country = country { endpoint = baseURL + status + "/\(country.replaceSpace(with: "-"))" + duration }
        
        guard let url = URL(string: endpoint) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _  = error { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            do 
            {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let obj  = try decoder.decode(Model.self, from: data)
                completed(obj)
            }  
            catch let err 
            {
                print(err)
            }
        }
        
        task.resume()
    }
}
