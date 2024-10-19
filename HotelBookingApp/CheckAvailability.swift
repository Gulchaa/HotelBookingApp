import SwiftUI
import Foundation

struct DateRange {
    var startDate: Date
    var endDate: Date
}

struct CheckAvailability: View {
    
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @State private var selectedMonthOffset = 0
    @State private var dates: [Date] = []
    
    var hotel: HotelItem
    
    var body: some View {
        VStack {
            Image(hotel.picture)
                .resizable()
                .scaledToFit()
                .frame(width: 158, height: 120)
                .cornerRadius(30)
                .padding()
            Text(hotel.name)
                .font(.headline)
            Text("\(hotel.price, specifier: "%.2f") € per night")
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            
            VStack {
                Text("Select the days of your stay")
                    .font(.title2)
                    .bold()
                
                HStack {
                    Spacer()
                    Button(action: {
                        selectedMonthOffset -= 1
                        updateDates()
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 32)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                    
                    Text(monthAndYearString())
                        .font(.title2)
                    Spacer()
                    Button(action: {
                        selectedMonthOffset += 1
                        updateDates()
                    }) {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 32)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                }
                .padding()
                
                HStack {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 12, weight: .medium))
                            .frame(maxWidth: .infinity)
                    }
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                    ForEach(0..<leadingEmptyDays(), id: \.self) { _ in
                        Text("") // Empty space for alignment
                            .frame(width: 40, height: 40)
                    }
                    ForEach(dates, id: \.self) { date in
                        Text(dateFormatted(date))
                            .frame(width: 40, height: 40)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(20)
                            .padding(2)
                            .foregroundColor(.blue)
                    }
                }
            }
            .onAppear {
                updateDates()
            }
            .padding()
        }
    }
    
    private func fetchSelectedMonth() -> Date {
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Check if the selectedMonthOffset is negative
        if selectedMonthOffset < 0 {
            print("Invalid selected month offset")
            selectedMonthOffset = 0
        }
        
        // Calculate the new date
        guard let month = calendar.date(byAdding: .month, value: selectedMonthOffset, to: currentDate) else {
            return currentDate
        }
        
        return month
    }

    
    private func updateDates() {
        let calendar = Calendar.current
        let selectedDate = fetchSelectedMonth()
        let year = calendar.component(.year, from: selectedDate)
        let month = calendar.component(.month, from: selectedDate)
        dates = daysInMonth(year: year, month: month)
    }
    
    private func monthAndYearString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: fetchSelectedMonth())
    }
    
    private func dateFormatted(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
    
    private func leadingEmptyDays() -> Int {
        guard let firstDate = dates.first else { return 0 }
        let weekday = Calendar.current.component(.weekday, from: firstDate)
        return (weekday + 5) % 7
    }
}

func daysInMonth(year: Int, month: Int) -> [Date] {
    var dates: [Date] = []
    let calendar = Calendar.current
    
    var dateComponents = DateComponents(year: year, month: month)
    dateComponents.day = 1
    
    guard let startDate = calendar.date(from: dateComponents),
          let range = calendar.range(of: .day, in: .month, for: startDate) else {
        return dates
    }
    
    for day in range {
        dateComponents.day = day
        if let date = calendar.date(from: dateComponents) {
            dates.append(date)
        }
    }
    
    return dates
}

#Preview {
    let year = 2024
    let month = 10
    let datesInOctober = daysInMonth(year: year, month: month)
    CheckAvailability(hotel: HotelItem(id: UUID(), name: "Hotel Test", price: 90, type: .standard, reviews: nil, picture: "hotel1"))
}

