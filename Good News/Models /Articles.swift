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

extension ArticlesList {
	
	static var all:Resource<ArticlesList> = {
		let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e03da12b408445449464ceb16db4963a")!
		return Resource(url: url)
	}()
	
}
