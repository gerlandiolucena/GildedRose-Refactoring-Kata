//
//  File.swift
//  
//
//  Created by Gerlandio Lucena on 28/02/21.
//

import Foundation

public class AgedItem: CommonItem {
    public override init(name: String, sellIn: Int, quality: Int, category: QualityCategory = .aged) {
        super.init(name: name, sellIn: sellIn, quality: quality, category: category)
    }
}
