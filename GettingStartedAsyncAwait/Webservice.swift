//
//  Webservice.swift
//  GettingStartedAsyncAwait
//
//  Created by David Malicke on 6/11/22.
//

import Foundation

class Webservice {
    
    func getDate() async throws -> CurrentDate? {
        guard let url = URL(string: "https://ember-sparkly-rule.glitch.me/current-date") else {
            fatalError("URL is incorrect!")
        }
        
       let (data, _) = try await URLSession.shared.data(from: url)
        return try? JSONDecoder().decode(CurrentDate.self, from: data)
    }
}
