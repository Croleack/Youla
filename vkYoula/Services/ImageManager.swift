//
//  ImageManager.swift
//  vkYoula
//
//  Created by Enzhe Gaysina on 28.03.2024.
//

import SwiftUI

struct ImageManager: View {
    let url: String
    @State private var imageData: Data?
    
    var body: some View {
	   if let imageData = imageData, let uiImage = UIImage(data: imageData) {
		  Image(uiImage: uiImage)
			 .resizable()
	   } else {
		  Image(systemName: "photo")
			 .task {
				await loadImage()
			 }
	   }
    }
    
    private func loadImage() async {
	   guard let url = URL(string: url) else { return }
	   do {
		  let request = URLRequest(url: url)
		  let (data, _) = try await URLSession.shared.data(for: request)
		  DispatchQueue.main.async {
			 self.imageData = data
		  }
	   } catch {
		  print("Failed to load image: \(error)")
	   }
    }
}
