//
//  CustomDatePickerView.swift
//  CustomDatePicker-SwiftUI
//
//  Created by Juan Sebastian Orozco Buitrago on 3/2/22.
//

import SwiftUI

struct CustomDatePickerView: View {
    
    //MARK: - PROPERTIES
    
    @Binding var currentDate: Date
    
    // Month update on arrow button clicks...
    @State var currentMonth: Int = 0
    
    //MARK: - BODY
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Days...
            let days: [String] = [
                "Sun","Mon","Tue","Wed","Thu","Fri","Sat",
            ]
            
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(extraDate()[0])
                        .font(.caption.bold())
                        .fontWeight(.semibold)
                    
                    Text(extraDate()[1])
                        .font(.title.bold())
                } //: VSTACK
                
                Spacer(minLength: 0)
                
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2.bold())
                        .foregroundColor(Color("Orange"))
                    
                }
                
                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2.bold())
                        .foregroundColor(Color("Orange"))
                    
                }

            } //: HSTACK
            .padding(.horizontal)
            // Day View...
            
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            } //: HSTACK
            
            // Dates...
            
            // Lazy Grid...
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color("Orange"))
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            } //: LAZYVGRID
            
            VStack(spacing: 15) {
                
                Text("Tasks")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }) {
                    
                    ForEach(task.task) { task in
                        VStack(alignment: .leading, spacing: 10) {
                            // FOr Custom Timing
                            Text(task.time.addingTimeInterval(CGFloat.random(in: 0...5000)) , style: .time)
                            
                            Text(task.title)
                                .font(.title2.bold())
                        }
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Color("Green")
                                .opacity(0.5)
                                .cornerRadius(10)
                        )
                    }
                    
                } else {
                    Text("No Task Found")
                }
                
            }
            .padding()
            
        } //: VSTACK
        .onChange(of: currentMonth) { newValue in
            
            // updating Month...
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }) {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : Color("Orange"))
                        .frame(width: 8, height: 8)
                } else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        } //: VSTACK
        .padding(.vertical, 8)
        .frame(height: 60, alignment: .top)
    }
    
    // Checking dates...
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    // extracting Year and Month for display...
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        
        let calendar = Calendar.current
        
        // Getting Current Month Date...
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        
        return currentMonth
        
    }
    
    func extractDate() -> [DateValue] {
        
        let calendar = Calendar.current
        
        // Getting Current Month Date...
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            // getting day...
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        // adding offset days to get exact week day...
        let firstWeekDay = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekDay - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
}

//MARK: - PREVIEW

struct CustomDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

// Extending Date to get Current Month Dates....
extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        // getting start Date...
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        // getting date...
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
