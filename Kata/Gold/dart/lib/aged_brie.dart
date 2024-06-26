import 'package:gilded_rose/gilded_rose.dart';

final class AgedBrie {
  updateQuality(Item item) {
    final quality = item.quality;
    final sellInDays = item.sellIn;

    if (quality < 50) {
      item.quality = quality + 1;
    }

    item.sellIn = sellInDays - 1;

    if (sellInDays < 0) {
      if (quality < 50) {
        item.quality = quality + 1;
      }
    }
  }
}
