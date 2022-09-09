class ResistorColor {
  List<String> colors = [
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white'
  ];

  int colorCode(String color) {
    int result = 0;
    for (int i = 0; i < colors.length; i++) {
      if (colors[i] == color) {
        result = i;
      }
    }

    return result;
  }
}
