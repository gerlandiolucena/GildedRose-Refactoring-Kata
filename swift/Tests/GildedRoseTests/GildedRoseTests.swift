@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    
    func testCommonItem() {
        let items = [CommonItem(name: "Elixir of the Mongoose", sellIn: 5, quality: 10)]
        let app = GildedRose(items: items);
        for _ in 1...7 {
            app.updateQuality();
        }
        XCTAssertEqual(items.first!.sellIn, -2)
        XCTAssertEqual(items.first!.quality, 1)
    }
    
    func testLegendaryItem() {
        let items = [LegendaryItem(name: "Sulfuras, Hand of Ragnaros", sellIn: 10, quality: 80)]
        let app = GildedRose(items: items);
        for _ in 1...10 {
            app.updateQuality();
        }
        XCTAssertEqual(items.first!.sellIn, 10)
        XCTAssertEqual(items.first!.quality, 80)
    }
    
    func testAgedItem() {
        let items = [AgedItem(name: "Aged Brie", sellIn: 0, quality: 0)]
        let app = GildedRose(items: items);
        for _ in 1...55 {
            app.updateQuality();
        }
        XCTAssertEqual(items.first!.sellIn, -55)
        XCTAssertEqual(items.first!.quality, 50)
    }
    
    func testPassItemWithTenDaysLeft() {
        let items = [PassItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 10)]
        let app = GildedRose(items: items);
        for _ in 1...3 {
            app.updateQuality();
        }
        XCTAssertEqual(items.first!.sellIn, 7)
        XCTAssertEqual(items.first!.quality, 16)
    }
    
    func testPassItemWithFifteenDaysLeft() {
        let items = [PassItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20)]
        let app = GildedRose(items: items);
        for _ in 1...4 {
            app.updateQuality();
        }
        XCTAssertEqual(items.first!.sellIn, 11)
        XCTAssertEqual(items.first!.quality, 24)
    }
    
    func testPassItemWithFiveDaysLeft() {
        let items = [PassItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 15)]
        let app = GildedRose(items: items);
        for _ in 1...4 {
            app.updateQuality();
        }
        XCTAssertEqual(items.first!.sellIn, 1)
        XCTAssertEqual(items.first!.quality, 27)
    }
    
    func testPassItemWithThreeDaysLeft() {
        let items = [PassItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 3, quality: 40)]
        let app = GildedRose(items: items);
        for _ in 1...4 {
            app.updateQuality();
        }
        XCTAssertEqual(items.first!.sellIn, -1)
        XCTAssertEqual(items.first!.quality, 0)
    }
    
    func testConjuredItens() {
        let items = [ConjuredItem(name: "Conjured Mana Cake", sellIn: 6, quality: 12)]
        let app = GildedRose(items: items);
        for _ in 1...3 {
            app.updateQuality();
        }
        XCTAssertEqual(items.first!.sellIn, 3)
        XCTAssertEqual(items.first!.quality, 6)
    }
    
    static var allTests : [(String, (GildedRoseTests) -> () throws -> Void)] {
        return [
            ("testCommonItem", testCommonItem),
            ("testLegendaryItem", testLegendaryItem),
            ("testAgedItem", testAgedItem),
            ("testPassItemWithTenDaysLeft", testPassItemWithTenDaysLeft),
            ("testPassItemWithFifteenDaysLeft", testPassItemWithFifteenDaysLeft),
            ("test PassItem with five days left", testPassItemWithFiveDaysLeft),
            ("testConjuredItens", testConjuredItens)
        ]
    }
}
