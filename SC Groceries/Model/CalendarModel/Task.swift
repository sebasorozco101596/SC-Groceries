//
//  Task.swift
//  CustomDatePicker-SwiftUI
//
//  Created by Juan Sebastian Orozco Buitrago on 3/3/22.
//

import SwiftUI

// Task Model and Sample Tasks...
struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

// Total Task Meta View...
struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task : [Task]
    var taskDate: Date
}

// Sample Date for Testing...
func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

// Sample Tasks
var tasks: [TaskMetaData] = [

    TaskMetaData(task : [
        Task(title: "Talk to Sebas"),
        Task(title: "iPhone 13 Great Design Change"),
        Task(title: "Nothing Much Workout !!!")
    ], taskDate: getSampleDate(offset: 1)),
    TaskMetaData(task : [
        Task(title: "The bread expired")
    ], taskDate: getSampleDate(offset: -3)),
    TaskMetaData(task : [
        Task(title: "Meeting with Tim Cook")
    ], taskDate: getSampleDate(offset: -8)),
    TaskMetaData(task : [
        Task(title: "Next Version of SwiftUI")
    ], taskDate: getSampleDate(offset: 10)),
    TaskMetaData(task : [
        Task(title: "Nothing much Workout !!!")
    ], taskDate: getSampleDate(offset: -22)),
    TaskMetaData(task : [
        Task(title: "iPhone 14 will be greater than the iPhone 13")
    ], taskDate: getSampleDate(offset: 15)),
    TaskMetaData(task : [
        Task(title: "Sebas is a good Developer")
    ], taskDate: getSampleDate(offset: -20)),
]
