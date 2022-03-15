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
                    
                } label: {
                    
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title2)
                        .foregroundColor(.black)
                } //: BUTTON
                
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
            .padding([.horizontal, .top])
            
            TabView(selection: $currentTab) {
                
                Text("Home")
                    .tag("Home")
                
                Text("Calendar")
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
