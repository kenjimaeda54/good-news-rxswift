//
//  NewsTableViewController.swift
//  Good News
//
//  Created by kenjimaeda on 26/10/22.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
	
	//MARK: - Vars
	var disposed = DisposeBag()
	var articles: [Articles] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = true
		
		populatedNews()
	}
	
	func populatedNews() {
		
		let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e03da12b408445449464ceb16db4963a")!
		
		Observable.just(url).flatMap { url -> Observable<Data> in
			let urlRequest = URLRequest(url: url)
			return URLSession.shared.rx.data(request: urlRequest)
			// data -> essa seta aponta para retorno eu desejo retornar um array
			//Articles por isso ao fazer decode eu coloco .articles
		}.map { data -> [Articles]? in
			return try? JSONDecoder().decode(ArticlesList.self, from: data).articles
		}.subscribe(onNext: {[weak self] articles in
			
			if let articles = articles {
				self?.articles = articles
				DispatchQueue.main.async {
					self?.tableView.reloadData()
				}
				
			}
			
		}).disposed(by: disposed)
		
		
	}
	
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return articles.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellGodNews", for: indexPath) as! NewsTableViewCell
		let article = articles[indexPath.row]
		cell.prepareCell(article)
		return cell
	}
	
	
	
}
