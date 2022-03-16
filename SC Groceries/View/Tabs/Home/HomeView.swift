//
//  HomeView.swift
//  SC Groceries
//
//  Created by Juan Sebastian Orozco Buitrago on 3/16/22.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - PROPERTIES
    
    @Binding var showMenu: Bool
    
    //MARK: - BODY
    
    var body: some View {
        ZStack {
            
            Color.white
            Text("Heyyyyyyy")
        }
        .onTapGesture {
            if showMenu {
                withAnimation(.easeInOut) {
                    showMenu.toggle()
                }
            }
        }
    }
}

//MARK: - PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
