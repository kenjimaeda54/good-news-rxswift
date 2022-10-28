# Good News
App com requisicao via internet da [News api](https://newsapi.org/)


# Objetivo
Praticar conceitos relacionados a RxSwfit e operadores que transformam dados como map,flat map

## Feature
- Para realizar requisição via internet o ideal utilizar o flatMap, com este operador retornamos um Observable
- Com map retornamos tipo
- Vantagem de possuir um observador que podemos realizar sua subscrição e retornar um valor no futuro
- Para deixar código mais limpo usei extensions e estendi o objeto URLRequest
- Usei genérico para ser possível utilizar em outros lugares 


```swift

  //maneira de realizar requisicao

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
      
   //usando extension   
   
   //URLRequest+Extensions
   
   struct Resource<T: Codable> {
	let url: URL
}

extension URLRequest {
  
	static func load<T>(resource: Resource<T>) -> Observable<T?> {
		 
		Observable.from([resource.url]).flatMap { url -> Observable<Data> in
			 let urlRequest = URLRequest(url: url)
			return URLSession.shared.rx.data(request: urlRequest)
		}.map { data -> T? in
			return try? JSONDecoder().decode(T.self, from: data)
		}.asObservable()
		
	}
	
}

//ArticleList 
extension ArticlesList {
	
	static var all:Resource<ArticlesList> = {
		let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e03da12b408445449464ceb16db4963a")!
		return Resource(url: url)
	}()
	
}


//NewsTableViewController
	URLRequest.load(resource: ArticlesList.all).subscribe(onNext:{  [weak self ] results in
			
			if let articles = results?.articles {
				self?.articles = articles

				DispatchQueue.main.async {
					self?.tableView.reloadData()
				}

			}
		}).disposed(by: disposed)



```
