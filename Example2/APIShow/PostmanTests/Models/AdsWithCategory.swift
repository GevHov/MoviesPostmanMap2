//
//  AdsWithCategory.swift
//  Example2
//
//  Created by Gevorg Hovhannisyan on 20.12.21.
//

import Foundation

// MARK: - AdsWithCategory
struct AdsWithCategories: Codable {
    
    let category: Category
    let ads: [Ads]

}
