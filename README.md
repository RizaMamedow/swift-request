# Swift Request

A simple application for querying endpoints, my template for personal use. Collected from the Internet. In the code there are examples of JSON decoding and requests to a given URL.

I wanted to say about the API. I had a simple api for testing my console Swift program, it was written in Django with DRF

General Strokes
```swift
// in main:15
let dishes = try JSONDecoder().decode([Dish].self, from: data!) 
```

```swift
// in Models:24
struct Dish: Decodable {
    let id: Int // dish identificator
    var title: String // dish title
    var category: Category // dish category
    var price: Int // dish price
    var images: [DishImage] // dish image array
}
```

```swift
// in APICaller:18
if let url = URL(string: endpoint) {
   URLSession.shared.dataTask(with: url) { data, response, error in
       callback(data, response, error)
       sema.signal() // some semaphore command
   }.resume()
}
```
