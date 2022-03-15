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
}
