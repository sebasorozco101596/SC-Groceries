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
    
    //MARK: - BODY
    
    var body: some View {
        
        ZStack {
            
             // Custom Side Menu...
            SideMenuView(currentTab: $currentTab)
        }
    }
}

//MARK: - PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
