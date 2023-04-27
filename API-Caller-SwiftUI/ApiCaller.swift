//
//  ApiCaller.swift
//  API-Caller-SwiftUI
//
//  Created by ShafiulAlam-00058 on 3/24/23.
//

import Foundation
import SwiftUI

final class ApiCaller: ObservableObject {
    @Published var Newses: Welcome?
    
    func getData() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=7c412f998ea54dd4b21c4607dc09e75c") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let receivedData = try JSONDecoder().decode(Welcome.self, from: data)
                DispatchQueue.main.async {
                    self?.Newses = receivedData
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
