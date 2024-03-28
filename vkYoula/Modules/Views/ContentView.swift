//
//  ContentView.swift
//  vkYoula
//
//  Created by Enzhe Gaysina on 28.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ServiceViewModel()
    
    var body: some View {
	   NavigationView {
		  List(viewModel.services, id: \.name) { service in
			 ServiceRow(service: service)
		  }
		  .navigationBarTitle(Constants.titleNavigationBar)
	   }
	   .task {
		  await viewModel.fetchData()
	   }
    }
}

//MARK: -  extension constants

fileprivate extension ContentView {
    enum Constants {
	   static let titleNavigationBar = "Сервисы"
    }
}
