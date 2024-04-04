//
//  ServiceViewModel.swift
//  vkYoula
//
//  Created by Enzhe Gaysina on 28.03.2024.
//

import Foundation

class ServiceViewModel: ObservableObject {
    @Published var services: [Service] = []
    private let networkManager: NetworkManagerProtocol = NetworkManager()
    
    func fetchData() async {
	   do {
		  let serviceModel = try await networkManager.fetchData()
		  await MainActor.run(body: {
			 self.services = serviceModel.body.services
		  })
	   } catch {
		  print("Error fetching data: \(error)")
	   }
    }
}
