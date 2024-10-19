
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                ForEach(hotels) { hotel in
                    NavigationLink(destination: HotelDetailView(hotel: hotel)){
                        VStack(alignment: .leading){
                            Image(hotel.picture)
                                .resizable()
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                            HStack{
                                Text(hotel.name)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                Spacer()
                                VStack{
                                    HStack{
                                        let rating = averageStars(for: hotel)
                                        let wholeStars = Int(rating)
                                        let hasHalfStar = (rating - Double(wholeStars)) >= 0.5
                                        let totalStars = wholeStars + (hasHalfStar ? 1 : 0)
                                        
                                        let stars = Array(repeating: "star.fill", count: wholeStars) +
                                        Array(repeating: "star.lefthalf.fill", count: hasHalfStar ? 1 : 0) +
                                        Array(repeating: "star", count: 5 - totalStars)
                                        
                                        // Loop through the array of star types
                                        ForEach(0..<stars.count, id: \.self) { index in
                                            Image(systemName: stars[index])
                                                .foregroundColor(stars[index] == "star" ? .gray : .yellow)
                                                .font(.caption)
                                        }
                                        
                                    }
                                    Text(hotel.reviews?.isEmpty == false ? "Reviews: \(hotel.reviews!.count)" : "No reviews")
                                        .font(.caption)
                                    
                                        .font(.caption)
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding()
                        .shadow(radius:30)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

