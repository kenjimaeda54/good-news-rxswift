//
//  Articles.swift
//  Good News
//
//  Created by kenjimaeda on 28/10/22.
//

import Foundation

struct ArticlesList:Codable {
	let articles: [Articles]
}

struct Articles: Codable {
	let title: String
	let description: String?
}
