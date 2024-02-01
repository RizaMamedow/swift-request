//
//  APICaller.swift
//  swift-request
//
//  Created by Riza Mamedov on 01.02.2024.
//

import Foundation

// Simple structure for request to endpoint
struct APICalller {
    static func getRequest(
        endpoint: String, // Url of endpoint
        _ callback: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> () // this argument is needed to save/serialize/manipulate data
    ) -> Void {
        let sema = DispatchSemaphore(value: 0) // semaphore for correctly working our URLSession calling
        print("Fetching...")
        if let url = URL(string: endpoint) {
           URLSession.shared.dataTask(with: url) { data, response, error in
               callback(data, response, error)
               sema.signal() // some semaphore command
           }.resume()
        }
        sema.wait() // some semaphore command
    }
}
