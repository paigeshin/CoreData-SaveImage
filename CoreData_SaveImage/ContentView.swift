//
//  ContentView.swift
//  CoreData_SaveImage
//
//  Created by paige shin on 2023/01/14.
//

import SwiftUI

struct ContentView: View {
    
    @State var image: UIImage?
    
    var body: some View {
        VStack {
            Button("Download Image") {
                let url = URL(string: "https://i.pinimg.com/originals/d6/e4/0c/d6e40c3cefb1ca1f59134f3c89469e97.jpg")!
                URLSession.shared.dataTask(with: url) { data, _, error in
                    guard let data, error == nil else {
                        return
                    }
                    let context = CoreDataManager.shared.persistentContainer.viewContext
                    let photo = Photo(context: context)
                    photo.title = "Random Photo"
                    photo.content = UIImage(data: data)
                    try? context.save()
                    
                    DispatchQueue.main.async {
                        self.image = photo.content
                    }
                }
                .resume()
            }
            
            if let image {
                Image(uiImage: image)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
