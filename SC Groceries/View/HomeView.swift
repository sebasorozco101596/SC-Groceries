//
//  HomeView.swift
//  SC Groceries
//
//  Created by Juan Sebastian Orozco Buitrago on 3/14/22.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - PROPERTIES
    
    // Current Tab
    @State var currentTab: String = "Home"
    
    // Menu Option..
    @State var showMenu: Bool = false
    
    //MARK: - BODY
    
    // Hiding Native Tab Bar...
    init() {
        
        UITabBar.appearance().isHidden = true
        
    }
    
    var body: some View {
        
        ZStack {
            
             // Custom Side Menu...
            SideMenuView(currentTab: $currentTab)
            
            // Main Tab View...
            CustomTabView(currentTab: $currentTab, showMenu: $showMenu)
        }
        // Always Day Mode...
        .preferredColorScheme(.light)
    }
}

//MARK: - PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
