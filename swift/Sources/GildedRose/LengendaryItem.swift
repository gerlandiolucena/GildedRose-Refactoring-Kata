//
//  File.swift
//  
//
//  Created by Gerlandio Lucena on 25/02/21.
//

import Foundation

public class LegendaryItem: CommonItem {
    
    override var range: ClosedRange<Int> {
        category.quality...category.quality
    }
    
    override public init(name: String, sellIn: Int, quality: Int, category: QualityCategory = .legendary) {
        super.init(name: name, sellIn: sellIn, quality: quality)
        self.category = category
    }
}
