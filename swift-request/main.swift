//
//  main.swift
//  swift-request
//
//  Created by Riza Mamedov on 01.02.2024.
//

import Foundation

let urlString: String = "http://192.168.1.100:8000/api/dish/" // our Endpoint

APICalller.getRequest(endpoint: urlString, { (data, response, error) in
    do {
        var i: Int = 0
        let dishes = try JSONDecoder().decode([Dish].self, from: data!) // Decode the Dishes
        dishes.forEach {
            i += 1
            // print the dishes information
            print("\n#### Dish \(i) #####")
            print("Title: \($0.title)")
            print("Price: \($0.price)")
            print("Category: \($0.category.name)")
            print("Image count: \($0.images.count)")
        }
    } catch let error {
        print(error)
    }
})
