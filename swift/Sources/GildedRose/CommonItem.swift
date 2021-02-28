//
//  File.swift
//  
//
//  Created by Gerlandio Lucena on 25/02/21.
//

import Foundation

public class CommonItem: Item {
    public var category: QualityCategory
    var range: ClosedRange<Int> {
        0...category.quality
    }
    var qualityAssure: Int {
        get {
            return quality
        }
        set {
            quality = min(max(range.lowerBound, newValue), range.upperBound)
        }
    }
    
    public init(name: String, sellIn: Int, quality: Int, category: QualityCategory = .common) {
        self.category = category
        super.init(name: name, sellIn: sellIn, quality: quality)
    }
}
