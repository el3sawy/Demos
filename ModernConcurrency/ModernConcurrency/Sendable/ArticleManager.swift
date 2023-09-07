//
//  ArticleManager.swift
//  ModernConcurrency
//
//  Created by NTG on 26/08/2023.
//

import Foundation

actor ArticleManager {
    
     let articles = [
        Article(title: "Swift Senpai Article 01"),
        Article(title: "Swift Senpai Article 02"),
        Article(title: "Swift Senpai Article 03"),
    ]
    
    /// Increase like count by 1
    func like(_ articleTitle: String) {
        
        guard let article = getArticle(with: articleTitle) else {
            return
        }
        
        article.likeCount += 1
    }
    
    /// Get article based on article title
    func getArticle(with articleTitle: String) -> Article? {
        return articles.filter({ $0.title == articleTitle }).first
    }
}
