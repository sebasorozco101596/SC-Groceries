//
//  CalendarView.swift
//  SC Groceries
//
//  Created by Juan Sebastian Orozco Buitrago on 3/16/22.
//

import SwiftUI

struct CalendarView: View {
    
    //MARK: - PROPERTIES
    
    @State var currentDate: Date = Date()
    @State private var showNewDueDateView: Bool = false
    @Binding var showMenu: Bool
    
    //MARK: - BODY
    
    var body: some View {
        
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    // Custom Date Picker....
                    CustomDatePickerView(currentDate: $currentDate)
                }
                .padding(.vertical)
            } //: SCROLL
            // Distorting the background
            .blur(radius: showNewDueDateView ? 2.0 : 0 , opaque: false)
            .transition(.move(edge: .bottom))
            // Safe Area View...
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Button {
                        // Showing the add due date View
                        showNewDueDateView.toggle()
                    } label: {
                        Text("Add Due Date")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color("Orange"), in: Capsule())
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Add Reminder")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color("Green-hard"), in: Capsule())
                    }
                    
                } //: HSTACK
                .padding(.horizontal)
                .padding(.top, 10)
                .foregroundColor(.white)
                .background(.ultraThinMaterial)
            }
            
            if showNewDueDateView {
                Color.black
                    .opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation() {
                            showNewDueDateView.toggle()
                        }
                    }
                NewExpiredDateView(isShowing: $showNewDueDateView)
            }
        } //: ZSTACK
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

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
