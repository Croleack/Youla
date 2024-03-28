//
//  ServiceRow.swift
//  vkYoula
//
//  Created by Enzhe Gaysina on 28.03.2024.
//

import SwiftUI

struct ServiceRow: View {
    var service: Service
    
    @Environment(\.openURL) private var openURL
    
    var body: some View {
	   HStack {
		  ImageManager(url: service.iconURL)
			 .frame(width: Constants.imageWidthHeight,
				   height: Constants.imageWidthHeight)
			 .cornerRadius(Constants.imageCornerRadius)
		  VStack(alignment: .leading) {
			 Text(service.name)
				.font(.headline)
			 Text(service.description)
				.font(.subheadline)
		  }
	   }
	   .padding()
	   .onTapGesture {
		  if let url = URL(string: service.link) {
			 openURL(url)
		  }
	   }
    }
}

//MARK: -  extension constants

fileprivate extension ServiceRow {
    enum Constants {
	   static let imageWidthHeight = 50.0
	   static let imageCornerRadius = 8.0
    }
}
