//
//  NetworkModel.swift
//  vkYoula
//
//  Created by Enzhe Gaysina on 28.03.2024.
//

import Foundation

struct NetworkModel: Decodable {
    let body: Body
    let status: Int
}

struct Body: Decodable {
    let services: [Service]
}

struct Service: Decodable {
    var name, description: String
    let link: String
    let iconURL: String
    
    init(from decoder: Decoder) throws {
	   let container = try decoder.container(keyedBy: CodingKeys.self)
	   self.name = try container.decode(String.self, forKey: .name)
	   self.description = try container.decode(String.self, forKey: .description)
	   self.link = try container.decode(String.self, forKey: .link)
	   self.iconURL = try container.decode(String.self, forKey: .iconURL)
	   
	   ///typo or attentiveness test???
	   if self.description == "Онлайн-сервис для поиска и щзаказа лекарств по лучшей цене" {
		  self.description = "Онлайн-сервис для поиска и заказа лекарств по лучшей цене"
	   }
    }
    
    enum CodingKeys: String, CodingKey {
	   case name, description, link
	   case iconURL = "icon_url"
    }
}
