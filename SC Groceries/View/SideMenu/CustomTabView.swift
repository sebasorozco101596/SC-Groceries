//
//  CustomTabView.swift
//  SC Groceries
//
//  Created by Juan Sebastian Orozco Buitrago on 3/14/22.
//

import SwiftUI

struct CustomTabView: View {
    
    //MARK: - PROPERTIES
    
    @Binding var currentTab: String
    @Binding var showMenu: Bool
    
    //MARK: - BODY
    
    var body: some View {
        
        VStack {
            
            // Static Header View for all Pages...
            HStack {
                
                // Menu Button...
                Button {
                    
                    // Toggling Menu Option...
                    withAnimation(.spring()) {
                        showMenu = true
                    }
                    
                } label: {
                    
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title2)
                        .foregroundColor(.black)
                } //: BUTTON
                // Hidding when Menu is Visible...
                .opacity(showMenu ? 0 : 1)
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 35))
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.black)
                }
                
                
            } //: HSTACK
            // Page Title...
            .overlay(
                
                Text(currentTab)
                    .font(.title2.bold())
                    .foregroundColor(.black)
                // Same Hidding when menu is Visible...
                    .opacity(showMenu ? 0 : 1)
            )
            .padding([.horizontal, .top])
            .padding(.bottom, 8)
            .padding(.top, getSafeArea().top)
            
            TabView(selection: $currentTab) {
                
                HomeView(showMenu: $showMenu)
                    .tag("Home")
                
                CalendarView(showMenu: $showMenu)
                    .tag("Calendar")
                
                Text("Missing Groceries")
                    .tag("Missing Groceries")
                
                Text("List")
                    .tag("List")
                
                Text("Groceries")
                    .tag("Groceries")
                
                Text("Settings")
                    .tag("Settings")
                
                Text("Info")
                    .tag("Info")
                
            } //: TABVIEW
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            
            // Close Button...
            Button {
                
                // Toggling Menu Option...
                withAnimation(.spring()) {
                    showMenu = false
                }
                
            } label: {
                
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
            } //: BUTTON
            // Hidding when Menu is Visible...
                .opacity(showMenu ? 1 : 0)
                .padding()
                .padding(.top)
            
            , alignment: .topLeading
            
        )
        .background(
            Color("Green")
        )
    }
}

//MARK: - PREVIEW

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
