//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Sayani Chanda on 19/06/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    
  @StateObject var transationListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transationListVM)
        }
    }
}
