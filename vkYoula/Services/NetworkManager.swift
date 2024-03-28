//
//  NetworkManager.swift
//  vkYoula
//
//  Created by Enzhe Gaysina on 28.03.2024.
//

import Foundation

enum NetworkError: Error {
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case decodingError(Error)
    case encodingError(Error)
}

protocol NetworkManagerProtocol {
    func fetchData() async throws -> NetworkModel
}

final class NetworkManager: NetworkManagerProtocol {
    func fetchData() async throws -> NetworkModel {
	   guard let url = URL(string:"https://publicstorage.hb.bizmrg.com/sirius/result.json") else {
		  throw NetworkError.transportError(NSError(domain: "", code: 0, userInfo: nil))
	   }
	   
	   let (data, response) = try await URLSession.shared.data(from: url)
	   
	   guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
		  throw NetworkError.serverError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
	   }
	   
	   do {
		  let decodedData = try JSONDecoder().decode(NetworkModel.self, from: data)
		  return decodedData
	   } catch {
		  throw NetworkError.decodingError(error)
	   }
    }
}
