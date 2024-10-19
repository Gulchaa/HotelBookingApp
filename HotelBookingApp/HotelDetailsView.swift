import SwiftUI

struct HotelDetailView: View {
    
    var hotel: HotelItem
    
    init(hotel: HotelItem) {
        self.hotel = hotel
    }
    
    var body: some View {
        ScrollView{
            VStack(){
                Text(hotel.name)
                    .fontWeight(.semibold)
                    .font(.largeTitle)
                    .padding()
                Image(hotel.picture)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                Text("\(hotel.type.rawValue)")
                    .font(.headline)
                    .padding()
                NavigationLink(destination: CheckAvailability(hotel: hotel)) {
                    Text("Check availability")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Spacer()
                VStack(alignment: .leading, spacing: 10){
                    ForEach(hotel.reviews ?? [], id: \.self) { review in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(review.text)")
                                Text("\(review.author)")
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            let stars = Array(repeating: "star.fill", count: review.star) +
                            Array(repeating: "star", count: 5 - review.star)
                            
                            // Loop through the array of star types
                            ForEach(0..<stars.count, id: \.self) { index in
                                Image(systemName: stars[index])
                                    .foregroundColor(stars[index] == "star" ? .gray : .yellow)
                                    .font(.caption)
                            }
                        }
                        .padding()
                    }
                    
                }
            }
        }
    }
}

struct HotelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sample = HotelItem(name: "Royal Hotel", price: 100, type: .standard, reviews: hotel1, picture: "hotel1")
        HotelDetailView(hotel: sample)
    }
}

