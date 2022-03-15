//
//  SideMenuView.swift
//  SC Groceries
//
//  Created by Juan Sebastian Orozco Buitrago on 3/14/22.
//

import SwiftUI

struct SideMenuView: View {
    
    //MARK: - PROPERTIES
    
    @Binding var currentTab: String
    
    // Adding Smooth Transition between tabs with the help of Matched Geometry Effect...
    @Namespace var animation
    
    //MARK: - BODY
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: 15) {
                
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 45))
                    .clipShape(Circle())
                
                Text("User Name")
                    .font(.title2.bold())
                    .foregroundColor(Color("BW"))
            } //: HSTACK
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // For Small Screens
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                
                // Tab Buttons....
                VStack(alignment: .leading, spacing: 25) {
                    
                    CustomTabButton(icon: "house", title: "Home")
                    
                    CustomTabButton(icon: "calendar", title: "Calendar")
                    
                    CustomTabButton(icon: "cart", title: "Missing Groceries")
                    
                    CustomTabButton(icon: "list.bullet", title: "List")
                    
                    CustomTabButton(icon: "bag", title: "Groceries")
                    
                    CustomTabButton(icon: "gearshape", title: "Settings")
                    
                    CustomTabButton(icon: "info.circle.fill", title: "Info")
                    
                    Spacer()
                    
                    // Making Logout as constant button with orange color...
                    CustomTabButton(icon: "rectangle.portrait.and.arrow.right", title: "Logout")
                    
                    Text("Copyright© \nJuan S Orozco Buitrago\nSC Groceries 🥕🥑🍆")
                        .font(.caption2)
                        .fontWeight(.bold)
                    
                    
                    
                } //: VSTACK
                .padding()
                .padding(.top, 60)
            })
            
            // Max width of screen width...
            .frame(width: getRect().width / 2, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        } //: VSTACK
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color("Green")
        )
    }
    
    // Custom Button...
    @ViewBuilder
    func CustomTabButton(icon: String, title: String) -> some View {
        
        Button {
            
            if title == "Logout" {
                 // DO ACTION HERE >>>
                print("logout")
            } else {
                
                withAnimation {
                    
                    currentTab = title
                }
            }
            
            
        } label: {
            
            HStack(spacing: 12) {
                
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: currentTab == title ? 48 : nil , height: 48)
                    .foregroundColor(currentTab == title ? Color("Orange") : Color("BW"))
                    .background(
                        
                        ZStack {
                            
                            if currentTab == title {
                                Color("BW")
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABCIRCLE", in: animation)
                            }
                        } //: ZSTACK
                        
                    )
                
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("BW"))
                
            } //: HSTACK
            .padding(.trailing, 18)
            .background(
                
                ZStack {
                    
                    if currentTab == title {
                        
                        Color("Orange")
                            .clipShape(Capsule())
                            .matchedGeometryEffect(id: "TABCAPSULE", in: animation)
                    }
                }
                
            )
        } //: BUTTON
        .offset(x: currentTab == title ? 15 : 0)

    }
}

//MARK: - PREVIEW

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
