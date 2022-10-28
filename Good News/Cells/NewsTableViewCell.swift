//
//  NewsTableViewCell.swift
//  Good News
//
//  Created by kenjimaeda on 28/10/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
	
	@IBOutlet weak var labDescription: UILabel!
	@IBOutlet weak var labTitle: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
	}
	
	func prepareCell(_ article: Articles) {
		labTitle.text = article.title
		labDescription.text = article.description
	}
	
	
}
