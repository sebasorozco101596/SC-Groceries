//
//  HomeView.swift
//  SC Groceries
//
//  Created by Juan Sebastian Orozco Buitrago on 3/14/22.
//

import SwiftUI

struct MainView: View {
    
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
            // Appling Corner Radious...
                .cornerRadius(showMenu ? 25 : 0)
            // Making 3D rotation...
                .rotation3DEffect(.init(degrees: showMenu ? -15 : 0), axis: (x: 0, y: 1, z: 0), anchor: .trailing)
            // Moving View appart...
                .offset(x: showMenu ? getRect().width / 2 : 0)
                .ignoresSafeArea()
        }
        // Always Day Mode...
        .preferredColorScheme(.light)
    }
}

//MARK: - PREVIEW

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
