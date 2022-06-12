//
//  CurrentDate.swift
//  GettingStartedAsyncAwait
//
//  Created by David Malicke on 6/12/22.
//

import Foundation


struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
