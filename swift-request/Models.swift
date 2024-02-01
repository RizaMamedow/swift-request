//
//  Models.swift
//  swift-request
//
//  Created by Riza Mamedov on 01.02.2024.
//

import Foundation

// I have simple django api
// it's model was from this api

struct Category: Decodable {
    let id: Int // category Identificator
    var name: String // category name
}

struct DishImage: Decodable {
    let id: Int // image identificator
    var image: String // Image path
    var dish_id: Int // dish identificator
}

struct Dish: Decodable {
    let id: Int // dish identificator
    var title: String // dish title
    var category: Category // dish category
    var price: Int // dish price
    var images: [DishImage] // dish image array
}
