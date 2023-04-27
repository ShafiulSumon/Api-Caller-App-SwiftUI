//
//  ContentView.swift
//  API-Caller-SwiftUI
//
//  Created by ShafiulAlam-00058 on 3/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var apiCaller = ApiCaller()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(apiCaller.Newses?.articles ?? [], id: \.self) { news in
                    HStack {
                        ImageView(url: news.urlToImage ?? "")
                            .padding()
                        Text(news.title ?? "")
                    }
                }
            }
            .navigationTitle("Newses")
        }
        .onAppear() {
            apiCaller.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ImageView: View {
    
    var url: String
    @State var image: UIImage?
    
    var body: some View {
        
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 80)
                .foregroundColor(.gray)
        }
        else {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 80)
                .foregroundColor(.gray)
                .onAppear() {
                    self.getImage()
                }
        }
    }
    
    private func getImage() {
        guard let _url = URL(string: self.url) else {
            return
        }
        
        guard let image = CacheManager.shared.get(name: url) else {
            let task = URLSession.shared.dataTask(with: _url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                CacheManager.shared.add(image: (UIImage(data: data) ?? UIImage(systemName: "photo"))!, name: url)
                self.image = UIImage(data: data)
            }
            task.resume()
            
            return
        }
        
        self.image = image
        
    }
}
