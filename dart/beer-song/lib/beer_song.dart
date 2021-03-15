class BeerSong {
  List<String> recite(int f_num, int s_num) {
    List<String> result = [];

    for (int i = 0; i < s_num; i++) {
      if (f_num != 0) {
        result
            .add("$f_num bottles of beer on the wall, $f_num bottles of beer.");
      } else {
        result.add(
            "No more bottles of beer on the wall, no more bottles of beer.");
        result.add(
            "Go to the store and buy some more, 99 bottles of beer on the wall.");
      }

      f_num -= ++i;

      if (f_num == 0) {
        result.add(
            "Take it down and pass it around, no more bottles of beer on the wall.");
      } else {
        result.add(
            "Take one down and pass it around, $f_num bottles of beer on the wall.");
      }

      if ((++i) < s_num) {
        result.add("");
      }
    }

    return result;
  }
}
