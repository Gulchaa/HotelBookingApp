struct Review: Hashable{
    var text: String
    var author: String
    var date: String
    var star: Int = 0
    
    init(text: String, author: String, date: String, star: Int){
        self.text = text
        self.author = author
        self.date = date
        self.star = star
    }
}

var hotel1: [Review] = [
    Review(text: "Great hotel, amazing service!", author: "Andrew", date: "23.10.24", star: 5),
    Review(text: "I loved the view, the food was great!", author: "Dolly", date: "09.04.24", star: 5),
    Review(text: "I wish there was an AC in the room!", author: "Alice", date: "12.07.24", star: 4),
    Review(text: "Overall, a great experience, but could be not that pricy", author: "Henry", date: "03.08.24", star: 4),
    Review(text: "Thank you for the great service!", author: "Rebecca", date: "21.02.24", star: 5)
]
var hotel2: [Review] = [
    Review(text: "Great hotel, amazing service!", author: "Andrew", date: "23.10.24", star: 5),
]
var hotel3: [Review] = [
    Review(text: "Great hotel, amazing service!", author: "Andrew", date: "23.10.24", star: 5),
    Review(text: "I loved the view, the food was great!", author: "Dolly", date: "09.04.24", star: 5),
    Review(text: "I wish there was an AC in the room!", author: "Alice", date: "12.07.24", star: 2),
    Review(text: "Thank you for the great service!", author: "Rebecca", date: "21.02.24", star: 3)
]
var hotel4: [Review] = [
    Review(text: "Thank you for the great service!", author: "Rebecca", date: "21.02.24", star: 4)
]
var hotel5: [Review] = [
    Review(text: "Great hotel, amazing service!", author: "Andrew", date: "23.10.24", star: 3),
    Review(text: "Overall, a great experience, but could be not that pricy", author: "Henry", date: "03.08.24", star: 4),
    Review(text: "Thank you for the great service!", author: "Rebecca", date: "21.02.24", star: 5)
]

var hotel6: [Review] = [
    Review(text: "Overall, a great experience, but could be not that pricy", author: "Henry", date: "03.08.24", star: 3),
    Review(text: "Thank you for the great service!", author: "Rebecca", date: "21.02.24", star: 5)
]
var hotel7: [Review] = [
    Review(text: "Great hotel, amazing service!", author: "Andrew", date: "23.10.24", star: 5),
    Review(text: "I loved the view, the food was great!", author: "Dolly", date: "09.04.24", star: 5),
    Review(text: "I wish there was an AC in the room!", author: "Alice", date: "12.07.24", star: 1),
]



