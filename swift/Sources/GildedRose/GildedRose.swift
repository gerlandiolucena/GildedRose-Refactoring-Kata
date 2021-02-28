public class GildedRose {
    var items:[Item]
    
    public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality(item: CommonItem) {
        item.qualityAssure = item.qualityAssure + item.category.qualityVariation
        if item.sellIn < 0 {
            item.qualityAssure = item.qualityAssure + item.category.qualityVariation
        }
    }
    
    public func updateQuality(item: ConjuredItem) {
        item.qualityAssure = item.qualityAssure + (item.category.qualityVariation * 2)
    }
    
    public func updateQuality(item: AgedItem) {
        if let pass = item as? PassItem {
            var qualityMultiplier = pass.sellIn <= 0 ? 0 : 1
            if (5...10).contains(pass.sellIn) {
                qualityMultiplier = 2
            }
            if (1...5).contains(pass.sellIn)  {
                qualityMultiplier = 3
            }
            
            item.qualityAssure = item.qualityAssure + (item.category.qualityVariation * qualityMultiplier)
        } else {
            item.qualityAssure = item.qualityAssure + item.category.qualityVariation
        }
    }
    
    public func updateQuality() {
        for item in items {
            if type(of: item) != LegendaryItem.self {
                item.sellIn = item.sellIn - 1
            }
            
            if let conjured = item as? ConjuredItem {
                updateQuality(item: conjured)
            } else if let aged = item as? AgedItem {
                updateQuality(item: aged)
            } else if let common = item as? CommonItem {
                updateQuality(item: common)
            }
        }
    }
}
