//
//  ContentView.swift
//  BreakingBadApp
//
//  Created by Varshitha VRaj on 24/08/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            
    //MARK: TAB ONE
            Tab("Breaking Bad", systemImage: "tortoise") {
                QuoteView(show: "Breaking Bad")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
   //MARK: TAB TWO
            Tab("Better Call Saul", systemImage: "briefcase.fill") {
                
                QuoteView(show: "Better Call Saul")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
                
            }
        
        }
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    ContentView()
}
