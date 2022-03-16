//
//  ScreenBoundsExtension.swift
//  SC Groceries
//
//  Created by Juan Sebastian Orozco Buitrago on 3/14/22.
//

import SwiftUI

// Extending View to get Screen Bounds....

extension View {
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getSafeArea() -> UIEdgeInsets {
        
        guard let screen =
                UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
                    return .zero
                }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}
