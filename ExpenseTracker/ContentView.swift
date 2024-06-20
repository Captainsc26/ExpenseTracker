//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Sayani Chanda on 19/06/24.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    //var demoData: [Double] = [8, 2, 4, 6, 10, 9, 2]
    
    var body: some View {
        
        NavigationView {
            ScrollView{
                VStack{
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    let chartData = transactionListVM.accumulateTransactions()
                    
                    if !chartData.isEmpty {
                        
                        let totalExpense =  chartData.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading){
                                ChartLabel(totalExpense.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                LineChart()
                            }.background(Color.systemBackground)
                            
                            
                        }.data(chartData)
                            .chartStyle(ChartStyle(backgroundColor: Color.systemBackground,
                                                   foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        
                            .frame(height: 300)
                    }
                    
                    RecentTransactionList()
                    
                }.padding()
                    .frame(maxWidth: .infinity)
                
                
                
            }.background(Color.background)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    // MARK: Notification Bell
                    ToolbarItem{
                        Image(systemName: "bell.badge")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.icon,.primary)
                    }
                }
                .navigationTitle("Expense Tracker")
            
            
        }.navigationViewStyle(.stack)
            .accentColor(.primary)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group{
            ContentView()
            ContentView().preferredColorScheme(.dark)
        }.environmentObject(transactionListVM)
        
        
    }
}
