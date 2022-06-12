//
//  CurrentDateListViewModel.swift
//  GettingStartedAsyncAwait
//
//  Created by David Malicke on 6/11/22.
//

import Foundation

@MainActor
class CurrentDateListViewModel: ObservableObject {
    
    @Published var currentDates: [CurrentDateViewModel] = []
    
    
    func populateDates() async  {
        
        do {
            let currentDate = try await Webservice().getDate()
            if let currentDate = currentDate {
                let currentDateViewModel = CurrentDateViewModel(currentDate: currentDate)
                    self.currentDates.append(currentDateViewModel)
            }
        } catch {
            print(error)
        }
    }
}







struct CurrentDateViewModel {
    let currentDate: CurrentDate
    
    var id: UUID {
        currentDate.id
    }
    
    var date: String {
        currentDate.date
    }
    
}
