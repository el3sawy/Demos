import 'package:gilded_rose/aged_brie.dart';
import 'package:gilded_rose/gilded_rose.dart';

class GildedRose {
  List<Item> items;

  GildedRose(this.items);

  void updateQuality() {
    for (Item item in items) {
      doUpdateQuality(item);
    }
  }

  doUpdateQuality(Item item) {
    switch (item.name) {
      case "Aged Brie":
        final agedBrie = AgedBrie();
        agedBrie.updateQuality(item);
        break;
      case "Backstage passes to a TAFKAL80ETC concert":
        if (item.quality < 50) {
          item.quality = item.quality + 1;
          if (item.sellIn < 11) {
            if (item.quality < 50) {
              item.quality = item.quality + 1;
            }
          }
          if (item.sellIn < 6) {
            if (item.quality < 50) {
              item.quality = item.quality + 1;
            }
          }
        }
        item.sellIn = item.sellIn - 1;
        if (item.sellIn < 0) {
          item.quality = 0;
        }
        break;
      default:
        if (item.quality < 50) {
          item.quality = item.quality + 1;
        }
        item.sellIn = item.sellIn - 1;
        if (item.sellIn < 0) {
          if (item.quality < 50) {
            item.quality = item.quality + 1;
          }
        }
        break;
    }
  }
}
