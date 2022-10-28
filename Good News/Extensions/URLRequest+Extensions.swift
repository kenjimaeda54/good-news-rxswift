//
//  URLRequest+Extensions.swift
//  Good News
//
//  Created by kenjimaeda on 28/10/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

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
