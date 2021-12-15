extension Range on num {
  bool isBetween({required num from, required num to}) {
    return from < this && this < to;
  }

  bool isInRange(num from, num to) {
    if (from <= this && this <= to) {
      return true;
    } else if (to <= this && this <= from) {
      return true;
    } else {
      return false;
    }
  }
}
