//
//  ContentView.swift
//  GettingStartedAsyncAwait
//
//  Created by Mohammad Azam on 7/9/21.
//

import SwiftUI

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}

struct ContentView: View {
    
    @State private var currentDates: [CurrentDate] = []
    
    private func getDate() async throws -> CurrentDate? {
        guard let url = URL(string: "https://ember-sparkly-rule.glitch.me/current-date") else {
            fatalError("URL is incorrect!")
        }
        
       let (data, _) = try await URLSession.shared.data(from: url)
        return try? JSONDecoder().decode(CurrentDate.self, from: data)
    }
    
    //HAVE TO ADD "async" to all funcs that use funcs with async
    private func populateDates() async {
       
        do {
            guard let currentDate = try await getDate() else {return}
            currentDates.append(currentDate)
        } catch {
            print(error)
        }
    }

    var body: some View {
        NavigationView {
            List(1...10, id: \.self) { index in
                Text("\(index)")
            }.listStyle(.plain)
            
            .navigationTitle("Dates")
            .navigationBarItems(trailing: Button(action: {
                // button action
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
