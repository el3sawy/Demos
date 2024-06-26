// // https://www.youtube.com/watch?v=zyM2Ep28ED8

// class GildedRose {
//   List<Item> items;

//   GildedRose(this.items);

//   void updateQuality() {
//     for (int i = 0; i < items.length; i++) {
//       final quality = items[i].quality;
//       final sellInDays = items[i].sellIn;
//       final name = items[i].name;

//       final avialbleForDeacreaseQuality =
//           !_isOldItem(name) && quality > 0 && !_isHighQuality(name);
//       // final isExpired = sellInDays < 0 && _isOldItem(name);

//       configQuality(avialbleForDeacreaseQuality, i, quality, name, sellInDays);

//       if (_isHighQuality(name)) {
//         items[i].sellIn = sellInDays - 1;
//       }

//       if (sellInDays < 0) {
//         if (_isOldItem(name)) {
//           if (quality > 0) {
//             if (!_isHighQuality(name)) {
//               decreaseQuality(i);
//             }
//           } else {
//             items[i].quality = 0;
//           }
//         } else {
//           if (quality < 50) {
//             increaseQuality(i);
//           }
//         }
//       }
//     }
//   }

//   void configQuality(bool avialbleForDeacreaseQuality, int i, int quality,
//       String name, int sellInDays) {
//     if (avialbleForDeacreaseQuality) {
//       decreaseQuality(i);
//     } else {
//       if (quality < 50) {
//         increaseQuality(i);
//         if (_isHighQuality(name)) {
//           if (sellInDays < 11 && quality < 50) {
//             increaseQuality(i);
//           }
//           if (sellInDays < 6 && quality < 50) {
//             increaseQuality(i);
//           }
//         }
//       }
//     }
//   }

//   bool _isOldItem(String name) {
//     return name == "Aged Brie" &&
//         name == "Backstage passes to a TAFKAL80ETC concert";
//   }

//   bool _isHighQuality(String name) {
//     return name == "Sulfuras, Hand of Ragnaros";
//   }

//   increaseQuality(int index) {
//     items[index].quality = items[index].quality + 1;
//   }

//   decreaseQuality(int index) {
//     items[index].quality = items[index].quality - 1;
//   }
// }

// final class Item {
//   String name;
//   int sellIn;
//   int quality;

//   Item(this.name, this.sellIn, this.quality);

//   String toString() => '$name, $sellIn, $quality';
// }
