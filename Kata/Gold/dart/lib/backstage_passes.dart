class BackstagePasses {
  int sellIn;
  int quality;

  BackstagePasses(this.sellIn, this.quality);

  void updateQuality() {
    if (quality < 50) {
      quality = quality + 1;
      if (sellIn < 11) {
        if (quality < 50) {
          quality = quality + 1;
        }
      }
      if (sellIn < 6) {
        if (quality < 50) {
          quality = quality + 1;
        }
      }
    }
    sellIn = sellIn - 1;
    if (sellIn < 0) {
      quality = 0;
    }
  }
}
