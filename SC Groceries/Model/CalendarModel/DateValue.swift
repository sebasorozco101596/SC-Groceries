//
//  DateValue.swift
//  CustomDatePicker-SwiftUI
//
//  Created by Juan Sebastian Orozco Buitrago on 3/2/22.
//

import SwiftUI

// Date Value Model...
struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
